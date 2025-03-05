 #!/usr/bin/env bash
export PATH="$HOME/.cargo/bin:$PATH" # git-delta
GIT_WINDOW=$(tmux list-windows -F "#{window_name}" | awk '/^git$/ { print }')
EDITOR_WINDOW=$(tmux list-windows -F "#{window_name}" | awk '/^edt$/ { print }')
CURRENT_WINDOW=$(tmux display-message -p "#{window_name}")
CURRENT_PATH=$(tmux display-message -p "#{pane_current_path}")
if [ "$CURRENT_WINDOW" = "git" ]; then
	if [ -n "$EDITOR_WINDOW" ]; then
		tmux select-window -t edt
	else
		tmux select-window -t :0
	fi
elif [ -n "$GIT_WINDOW" ]; then
	tmux select-window -t git
else
	rightmost_index=$(tmux list-windows -F '#I' | sort -nr | head -n1)
	tmux select-window -t :$rightmost_index
	tmux new-window -a -n "git" "cd $CURRENT_PATH; lazygit"
fi
