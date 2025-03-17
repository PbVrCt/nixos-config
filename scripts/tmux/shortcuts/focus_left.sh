#!/usr/bin/env bash
is_leftmost_pane=$(tmux display-message -p '#{pane_at_left}')
# If it's the leftmost pane (or only pane), focus the left window
# Otherwise, focus the left pane
if [ "$is_leftmost_pane" -eq 1 ]; then
    window_count=$(tmux display-message -p '#{session_windows}')
    if [ "$window_count" -eq 1 ]; then
        tmux select-pane -L
    else
        tmux previous-window
    fi
else
    tmux select-pane -L
fi
