{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".aider.conf.yml".source = ../../modules/aider/aider.yml;
    ".aider.model.settings.yml".source = ../../modules/aider/aider_model.yml;
  };
}
