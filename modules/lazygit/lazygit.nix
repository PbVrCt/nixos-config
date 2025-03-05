{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file.".config/lazygit/config.yml".source = ../../modules/lazygit/lazygit.yml;
}
