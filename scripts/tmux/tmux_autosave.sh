#!/usr/bin/env bash

# Script to replace tmux-continuum on nixos. Meant to be called periodically from a systemd service
# https://blog.yuribocharov.dev/posts/2023/08/21/tmux-session-auto-saving-using-systemd

if [ "$(pgrep tmux)" ] && [ "$RES_SAVE_PATH" ]; then
  $RES_SAVE_PATH quiet
fi
