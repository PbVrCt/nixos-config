#!/usr/bin/env bash
# See the snapshots of the 'restic-repo' in one of my devices

# Get all possible repository locations
echo "Scanning for repositories..."
gum spin --title "Scanning locations" -- sleep 1
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

# Add local restore directory if it has a restic repository
RESTORE_PATH="/home/$USER/restore"
if [ -d "$RESTORE_PATH/restic-repo" ]; then
    REPO_OPTIONS+=("Local: restore directory - $RESTORE_PATH/restic-repo")
fi

# Check if we found any repositories
if [ ${#REPO_OPTIONS[@]} -eq 0 ]; then
    echo "No restic repositories found in mounted drives or ~/restore" | gum style --foreground 1
    exit 1
fi

# Let user select a repository using gum
gum style --foreground 6 "Select a repository to view snapshots from:"
SELECTED_REPO=$(gum choose --height 15 "${REPO_OPTIONS[@]}")

if [ -z "$SELECTED_REPO" ]; then
    echo "No repository selected. Exiting." | gum style --foreground 1
    exit 1
fi

# Extract the repository path from the selection
REPO_PATH=$(echo "$SELECTED_REPO" | sed -E 's/.*- (\/.*)/\1/')
REPO_NAME=$(echo "$SELECTED_REPO" | cut -d':' -f1 | tr -d ' ')
echo "Accessing repository at $REPO_PATH..." | gum style --foreground 6

# Show snapshots
restic snapshots -r "$REPO_PATH"

# Check command status
if [ $? -eq 0 ]; then
    gum style --foreground 2 --align center --width 50 "✓ Successfully displayed snapshots from $REPO_NAME repository"
else
    gum style --foreground 1 --align center --width 50 "✗ Failed to display snapshots from $REPO_NAME repository"
fi
