{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file.".config/foot/foot.ini".source = ../../modules/foot/foot.ini;
}
