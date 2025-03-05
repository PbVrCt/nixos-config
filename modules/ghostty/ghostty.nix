{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/ghostty/config".source = ../../modules/ghostty/ghostty;
  };
}
