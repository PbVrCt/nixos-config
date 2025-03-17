{pkgs, ...}: {
  programs.river.enable = true;
  programs.river.xwayland.enable = false;
  services.displayManager = {
    defaultSession = "river";
    sessionPackages = [pkgs.river];
  };
}
