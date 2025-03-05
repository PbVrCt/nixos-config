{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/yazi/yazi.toml".source = ../../modules/yazi/yazi.toml;
    ".config/yazi/keymap.toml".source = ../../modules/yazi/keymap.toml;
  };
}
