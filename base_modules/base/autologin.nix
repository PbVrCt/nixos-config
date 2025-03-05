{config, ...}: {
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = config.userDefinedGlobalVariables.mainUsername;
}
