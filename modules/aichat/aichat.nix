{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/aichat/config.yaml".source = ../../modules/aichat/aichat.yaml;
    ".config/aichat/macros/n.yaml".source = ../../modules/aichat/aichat_macro.yaml;
  };
}
