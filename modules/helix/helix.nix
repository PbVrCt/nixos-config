{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/helix/config.toml".source = ../../modules/helix/helix.toml;
    ".config/helix/languages.toml".source = ../../modules/helix/languages.toml;
  };
}
