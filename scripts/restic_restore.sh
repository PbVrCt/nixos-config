#!/usr/bin/env bash
# Select the ~/restic-repo backup or one from a device, and restore it to ~/restore
 
# Get all possible repository locations
echo "Scanning for repositories..."
gum spin --title "Scanning repositories" -- sleep 1
declare -a REPO_OPTIONS

# Add local home repository if it exists
HOME_REPO="$HOME/restic-repo"
if [ -d "$HOME_REPO" ]; then
    REPO_OPTIONS+=("Local: Home directory - $HOME_REPO")
fi

# Add mounted drives
MOUNTED_DRIVES=$(lsblk -o NAME,MOUNTPOINT,SIZE,LABEL -n | grep "/run/media/$USER" | awk '{print $4 " (" $3 ") - " $2}')
if [ -n "$MOUNTED_DRIVES" ]; then
    while IFS= read -r line; do
        MOUNT_POINT=$(echo "$line" | sed -E 's/.*- (\/run\/media\/[^ ]+).*/\1/')
        DRIVE_LABEL=$(echo "$line" | awk '{print $1}')
        REPO_PATH="$MOUNT_POINT/restic-repo"

        if [ -d "$REPO_PATH" ]; then
            REPO_OPTIONS+=("USB: $DRIVE_LABEL - $REPO_PATH")
        fi
    done <<< "$MOUNTED_DRIVES"
fi

# Check if we found any repositories
if [ ${#REPO_OPTIONS[@]} -eq 0 ]; then
    echo "No restic repositories found in home directory or mounted drives" | gum style --foreground 1
    exit 1
fi

# Let user select a repository using gum
gum style --foreground 6 "Select a repository to restore from:"
SELECTED_REPO=$(gum choose --height 15 "${REPO_OPTIONS[@]}")

if [ -z "$SELECTED_REPO" ]; then
    echo "No repository selected. Exiting." | gum style --foreground 1
    exit 1
fi

# Extract the repository path from the selection
REPO_PATH=$(echo "$SELECTED_REPO" | sed -E 's/.*- (\/.*)/\1/')
REPO_NAME=$(echo "$SELECTED_REPO" | cut -d':' -f1 | tr -d ' ')

# Create restore folder if it doesn't exist
RESTORE_PATH="/home/$USER/restore/"
mkdir -p "$RESTORE_PATH"

# Confirm restore operation
gum style --foreground 3 "Are you sure you want to restore from $REPO_NAME to $RESTORE_PATH?"
if ! gum confirm "Proceed with restore?"; then
    echo "Restore cancelled." | gum style --foreground 3
    exit 0
fi

# Perform the restore - do NOT use gum spin here because we need interactive password input
echo "Starting restore from $REPO_PATH..." | gum style --foreground 6
restic restore latest -r "$REPO_PATH" --target "$RESTORE_PATH"

# Check command status
if [ $? -eq 0 ]; then
    # Fix permissions on restored files if we used sudo
    if [[ "$REPO_PATH" == "$HOME_REPO" ]]; then
        echo "Fixing permissions on restored files..." | gum style --foreground 6
        sudo chown -R $USER:$USER "$RESTORE_PATH"
    fi
    gum style --foreground 2 --border rounded --align center --width 50 "✓ Restore from $REPO_NAME was successful!"
else
    gum style --foreground 1 --border double --align center --width 50 "✗ Restore from $REPO_NAME failed!"
fi
