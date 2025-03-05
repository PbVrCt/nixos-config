{
  config,
  pkgs,
  ...
}: {
  config = {
    home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.sessionVariables = {
      EDITOR = "hx";
      BROWSER = "firefox";
      TERMINAL = "foot";
      SHELL = "fish";
      XDG_CURRENT_DESKTOP = "river";
      WAYLAND_DISPLAY = "wayland-1";
      PYTHONDONTWRITEBYTECODE = 1;
      GOROOT = "${pkgs.go}/share/go";
      GOPATH = "$HOME/go";
      PATH = "$PATH:$GOROOT/bin:$GOPATH/bin";
    };
    environment.variables = {
    };
  };
}
