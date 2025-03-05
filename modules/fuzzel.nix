{
  pkgs,
  config,
  ...
}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        list-executables-in-path = true;
      };
    };
  };
}
