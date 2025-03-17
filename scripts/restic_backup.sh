#!/usr/bin/env bash
# Manual backup. See restic.nix for automatic backups

restic backup ~/projects ~/vault ~/.config/nixos ~/.config/keys.txt --repo ~/restic-repo \
  --exclude='*/.venv' \
  --exclude='*/node_modules' \
  --exclude='*.iso' \
  --compression max
