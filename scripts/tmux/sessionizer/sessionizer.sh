#!/usr/bin/env bash
export PATH="$HOME/.cargo/bin:$PATH"
sesh connect $(
	sesh list -t | fzf-tmux -p 55%,60% \
		--no-sort --prompt '⚡  ' --reverse \
		--color=bg:#1c1c1c,bg+:#1c1c1c,fg:#e4e4e4 \
		--header '  ^a all ^t tmux ^x zoxide ^f find' \
		--bind 'tab:down,btab:up' \
		--bind 'ctrl-a:change-prompt(⚡  )+reload($HOME/go/bin/sesh list)' \
		--bind 'ctrl-t:change-prompt(🪟  )+reload($HOME/go/bin/sesh list -t)' \
		--bind 'ctrl-x:change-prompt(📁  )+reload($HOME/go/bin/sesh list -z)' \
		--bind 'ctrl-f:change-prompt(🔎  )+reload(bash -c "source $HOME/.config/nixos/scripts/tmux/sessionizer/find.sh; sessionizer_find")'
)
