{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/keepassxc/keepassxc.ini".source = ../../modules/keepassxc/keepassxc.ini;
  };
}
