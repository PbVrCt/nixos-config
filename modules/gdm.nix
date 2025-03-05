{
  config,
  pkgs,
  lib,
  ...
}: {
  # Display manager: Handles login in
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  # Workaround for autologin to work: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
