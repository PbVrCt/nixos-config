{config, ...}: {
  # Stuff needed for Wayland. The name is misleading, it includes things for both X11 and Wayland. It hasn't been deprecated because of backwards compatiblity.
  config.services.xserver.enable = true;

  # # Disable X11 libraries: Does not work yet
  # environment.noXlibs = true;
  # nixpkgs.config.packageOverrides = pkgs: {
  #   pipewire = pkgs.pipewire.override { x11Support = false; };
  # };
}
