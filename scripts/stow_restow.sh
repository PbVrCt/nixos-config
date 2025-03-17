mkdir -p "$HOME/.config/aichat"
mkdir -p "$HOME/.config/fcitx5"
mkdir -p "$HOME/.config/fish"
mkdir -p "$HOME/.config/foot"
mkdir -p "$HOME/.config/ghostty"
mkdir -p "$HOME/.config/git"
mkdir -p "$HOME/.config/helix"
mkdir -p "$HOME/.config/i3bar-river"
mkdir -p "$HOME/.config/i3status-rust"
mkdir -p "$HOME/.config/keepassxc"
mkdir -p "$HOME/.config/lazygit"
mkdir -p "$HOME/.config/newsboat"
mkdir -p "$HOME/.config/yazi"
mkdir -p "$HOME/.peaclock"
mkdir -p "$HOME/.config/river"
mkdir -p "$HOME/.config/yazi"
mkdir -p "$HOME/.config/git"

# Update symlinks to the dotfiles:
cd "$HOME/.config/nixos/dotfiles" || exit  
stow --restow aichat        -t "$HOME/.config/aichat"
stow --restow aider         -t "$HOME"
stow --restow fcitx5        -t "$HOME/.config/fcitx5" --adopt
stow --restow fish          -t "$HOME/.config/fish"
stow --restow foot          -t "$HOME/.config/foot"
stow --restow ghostty       -t "$HOME/.config/ghostty"
stow --restow git           -t "$HOME/.config/git"
stow --restow helix         -t "$HOME/.config/helix"
stow --restow i3bar-river   -t "$HOME/.config/i3bar-river"
stow --restow i3status-rust -t "$HOME/.config/i3status-rust"
stow --restow keepassxc     -t "$HOME/.config/keepassxc"
stow --restow lazygit       -t "$HOME/.config/lazygit"
stow --restow newsboat      -t "$HOME/.config/newsboat"
stow --restow peaclock      -t "$HOME/.peaclock"
stow --restow river         -t "$HOME/.config/river"
stow --restow yazi          -t "$HOME/.config/yazi"
stow --restow tmux          -t "$HOME/"
stow --restow git           -t "$HOME/.config/git"

# Delete them:
# cd $HOME/.config/nixos/dotfiles
# stow --delete $PACKAGE -t "path-to-symlinks-folder/$PACKAGE"
# i.e.:
# cd $HOME/.config/nixos/dotfiles
# stow --delete aichat -t "$HOME/.config/aichat" 
