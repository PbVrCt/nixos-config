{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/newsboat/config".source = ../../modules/newsboat/newsboat;
    ".config/newsboat/urls".source = ../../modules/newsboat/newsboat_urls;
  };
}
