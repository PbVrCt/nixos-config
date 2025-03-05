{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".peaclock/config".source = ../../modules/peaclock/peaclock;
  };
}
