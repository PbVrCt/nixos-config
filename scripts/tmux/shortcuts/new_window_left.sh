 #!/usr/bin/env bash
# Get the index of the leftmost window (with the smallest index number)
leftmost_index=$(tmux list-windows -F '#I' | sort -n | head -n1)
# Select the leftmost window
tmux select-window -t :$leftmost_index
# Create a new window to the left of the leftmost window
tmux neww -b
# Optionally, you can select the newly created window if you want to switch to it immediately
# tmux select-window -t :$((leftmost_index))
