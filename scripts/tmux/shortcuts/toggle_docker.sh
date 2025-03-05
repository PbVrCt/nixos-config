 #!/usr/bin/env bash
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
DOCKER_WINDOW=$(tmux list-windows -F "#{window_name}" | awk '/^docker$/ { print }')
NVIM_WINDOW=$(tmux list-windows -F "#{window_name}" | awk '/^nvim$/ { print }')
CURRENT_WINDOW=$(tmux display-message -p "#{window_name}")
CURRENT_PATH=$(tmux display-message -p "#{pane_current_path}")
if [ "$CURRENT_WINDOW" = "docker" ]; then
	if [ -n "$NVIM_WINDOW" ]; then
		tmux select-window -t nvim
	else
		tmux select-window -t :0
	fi
elif [ -n "$DOCKER_WINDOW" ]; then
	tmux select-window -t docker
else
	rightmost_index=$(tmux list-windows -F '#I' | sort -nr | head -n1)
	tmux select-window -t :$rightmost_index
	tmux new-window -a -n "docker" "cd $CURRENT_PATH; lazydocker"
fi
