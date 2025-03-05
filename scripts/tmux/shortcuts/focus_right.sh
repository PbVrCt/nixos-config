#!/usr/bin/env bash
# Check if the current pane is the rightmost pane
is_rightmost_pane=$(tmux display-message -p '#{pane_at_right}')
# If it's the rightmost pane (or only pane), focus the right window
# Otherwise, focus the right pane
if [ "$is_rightmost_pane" -eq 1 ]; then
    window_count=$(tmux display-message -p '#{session_windows}')
    if [ "$window_count" -eq 1 ]; then
        tmux select-pane -R
    else
        tmux next-window
    fi
else
    tmux select-pane -R
fi
