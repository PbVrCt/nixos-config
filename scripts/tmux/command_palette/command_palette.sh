#!/usr/bin/env bash
# Function to display the command palette and execute the selected script
function command_palette() {
	local options=("Clone repo" "New repo" "Switch worktree" "New branch" "New branch from remote" "New branch detached head" "Delete branch" "Clone repo - no w" "New repo - no w" "Save document")
	local selected=$(
		printf "%s\n" "${options[@]}" | fzf-tmux -p 55%,60% \
			--reverse --color=bg:#1c1c1c,bg+:#1c1c1c,fg:#e4e4e4 \
			--bind 'tab:down,btab:up'
	)
	case $selected in
	"Clone repo")
		~/.config/nixos/scripts/tmux/command_palette/clone_repo_worktree.sh
		;;
	"New repo")
		~/.config/nixos/scripts/tmux/command_palette/new_repo_worktree.sh
		;;
	"Switch worktree")
		~/.config/nixos/scripts/tmux/command_palette/switch_worktree.sh
		;;
	"New branch")
		~/.config/nixos/scripts/tmux/command_palette/new_branch_worktree.sh
		;;
	"New branch from remote")
		~/.config/nixos/scripts/tmux/command_palette/new_branch_from_remote_worktree.sh
		;;
	"Delete branch")
		~/.config/nixos/scripts/tmux/command_palette/delete_branch_worktree.sh
		;;
	"New branch detached head")
		~/.config/nixos/scripts/tmux/command_palette/new_branch_detached_head_worktree.sh
		;;
	"Clone repo - no w")
		~/.config/nixos/scripts/tmux/command_palette/clone_repo.sh
		;;
	"New repo - no w")
		~/.config/nixos/scripts/tmux/command_palette/new_repo.sh
		;;
	"Save document")
		~/.config/nixos/scripts/save_document.sh
		;;
	*)
		echo "Invalid selection"
		;;
	esac
}
# Main script starts here
if [[ $# -eq 1 ]]; then
	command_palette "$1"
else
	command_palette
fi
