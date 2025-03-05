{pkgs, ...}: {
  ## PROGRAM CONFIGURATION
  imports = [
    # Configured with regular config files:
    ../../modules/kanata/kanata.nix
    ../../modules/river/river.nix
    ../../modules/ghostty/ghostty.nix
    ../../modules/helix/helix.nix
    ../../modules/lazygit/lazygit.nix
    ../../modules/yazi/yazi.nix
    ../../modules/aichat/aichat.nix
    ../../modules/aider/aider.nix
    ../../modules/fcitx5/fcitx5.nix
    ../../modules/keepassxc/keepassxc.nix
    ../../modules/newsboat/newsboat.nix
    ../../modules/peaclock/peaclock.nix
    # Configured with nixos options:
    ../../modules/restic.nix
    ../../modules/gdm.nix
    ../../modules/steam.nix
    ../../modules/android.nix
    # Configured with home manager as a nixos module:
    ../../modules/fish.nix
    ../../modules/fuzzel.nix
    ../../modules/git.nix
    ../../modules/firefox.nix
    ../../modules/tmux/tmux.nix
    # Programs initialized with systemd
    ../../modules/tmux/tmux_systemd.nix
    # Hardware
    ../../base_modules/hardware/graphics.nix
    ../../base_modules/hardware/intel_hardware_decoding.nix
    # Options: For referencing them across all nix files.
    ./options.nix
    # # Secrets
    ./sopsnix.nix
    # Environment variables
    ./env_vars.nix
    # Hardware. Include the results of the hardware scan: NixOS generates this file, don't copy it.
    ./hardware-configuration.nix
    # Fixed: Meant to remain unchanged for a while.
    ../../base_modules/base/home_manager_as_nixos_module.nix
    ../../base_modules/base/user.nix # Don't forget to set a password with ‘passwd’.
    ../../base_modules/base/system_version.nix
    ../../base_modules/base/locale.nix
    ../../base_modules/base/autologin.nix
    ../../base_modules/base/no_password.nix
    ../../base_modules/base/bootloader.nix
    ../../base_modules/base/xdg.nix
    ../../base_modules/base/audio_video.nix
    ../../base_modules/base/battery.nix
    ../../base_modules/base/fonts.nix
    ../../base_modules/base/bluetooth.nix
    ../../base_modules/base/path.nix
    ../../base_modules/base/unfree.nix
    ../../base_modules/base/virtualisation.nix
    ../../base_modules/base/security.nix
    ../../base_modules/base/experimental.nix
    ../../base_modules/base/garbage_collection.nix
    ../../base_modules/base/network.nix
    ../../base_modules/base/openssh.nix
    ../../base_modules/base/printing.nix
    ../../base_modules/base/wayland_x11.nix
  ];

  ## PROGRAM INSTALLATION. Note how easy this is.
  # sops-nix has to be installed through a flake, but that's it
  environment.systemPackages = with pkgs; [
    simplex-chat-desktop
    # Backups
    restic
    # Api key management
    sops
    age
    ssh-to-age
    veracrypt
    # ripsecrets
    # Password manager
    keepassxc
    # # Privacy
    # mat2
    # Keyboard remapper
    kanata-with-cmd
    # Compositor (windows)
    river
    wayland
    wl-clipboard
    i3bar-river
    i3status-rust
    mako
    # Terminal multiplexer (windows)
    tmux
    sesh
    # IDE
    helix
    lazygit
    serpl
    # AI assistant
    aichat
    ## aider as nix-shell
    playwright # for aider
    # claude-code
    # App launcher
    fuzzel
    # Terminal
    foot
    ghostty
    # Interactive shell
    fish
    # Login shell (scripts)
    bash
    gum
    zoxide
    fzf
    fd
    ripgrep
    guvcview
    # File manager
    yazi
    bashmount
    # File manager gui
    nautilus
    # Clipboard manager
    clipse
    # Browser
    (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {pipewireSupport = true;}) {})
    brave
    # RSS
    newsboat
    # Pdf viewer
    sioyek
    # Western fonts
    # nerd-fonts.hack
    # nerd-fonts.jetbrains-mono
    # nerd-fonts.symbols-only
    (nerdfonts.override {fonts = ["Hack"];})
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
    (nerdfonts.override {fonts = ["NerdFontsSymbolsOnly"];})
    noto-fonts-emoji
    papirus-icon-theme
    # Asian fonts
    # fcitx5
    # fcitx5-mozc
    # fcitx5-configtool
    ipafont
    takao
    kochi-substitute
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    # Git
    git
    delta
    difftastic
    git-lfs
    gh
    glab
    # jujutsu
    # Docker
    docker
    # docker-compose
    lazydocker
    # Sql
    # sqlite
    # Miscelanious
    nix-search-cli
    tree
    tokei
    upiano
    peaclock
    # Battery management
    tlp
    powertop
    # Device monitoring
    bottom
    bandwhich
    macchina
    dust
    nix-tree
    # Audio
    pipewire
    wireplumber
    pulsemixer
    # Brightness
    brightnessctl
    # Screenshots
    grim
    slurp
    swappy
    # Recording
    vhs
    ffmpeg
    # ttyd
    # wf-recorder
    # Base linux stuff
    coreutils
    # Languages
    # grpc-tools
    ## Text
    # pandoc
    # jless
    ## Markdown
    marksman
    dprint
    ## Toml
    taplo
    ## Nix
    nil
    alejandra
    ## Python
    python312Full
    ruff
    ruff-lsp
    python312Packages.python-lsp-server
    python312Packages.python-lsp-ruff
    pyright
    black
    uv
    # python312Packages.debugpy
    # pipx
    # stdenv.cc.cc.lib
    # glib.out
    # libGL
    # Bash
    bash-language-server
    ## Go
    go
    pkg-config
    alsa-lib
    portaudio
    gopls
    golangci-lint
    protoc-gen-go
    protoc-gen-go-grpc
    delve
    ## Typescript
    typescript
    biome
    typescript-language-server
    yarn
    nodejs_22
    # ##Julia
    # julia
    # # Elixir
    # elixir
    # erlang
    # elixir-ls
    # ## Arduino
    # arduino-ide
    # arduino-cli
    # arduino-mk
    # # Raspberry
    # rpiboot
    # rpi-imager
    # ## Kotlin
    # kotlin-language-server
    # ktfmt
    # android-tools
    # ## Flutter
    # flutter
    # dart
    # # Rust
    # rustup
    # cargo
    # ## C
    # clang-tools_18
    # lldb
    # ## C-Sharp
    # omnisharp-roslyn
    # netcoredbg

    # # Office apps
    # libreoffice
    # inkscape-with-extensions

    # # Steam
    # steam
    # protonplus
  ];
}
