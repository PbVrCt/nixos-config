{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (lib // builtins) listToAttrs;
in {
  programs.river.enable = true;
  programs.river.xwayland.enable = false;
  services.displayManager = {
    defaultSession = "river";
    sessionPackages = [pkgs.river];
  };
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/river/init" = {
      source = ../../modules/river/init;
      executable = true;
    };
    ".config/i3bar-river/config.toml".source = ../../modules/river/i3bar_river.toml;
    ".config/i3status-rust/config.toml".source = ../../modules/river/i3status_rust.toml;
    # i3status_rust is invoked from i3bar_river
  };
}
