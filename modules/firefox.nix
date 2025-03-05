{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.xdg.mimeApps = {
    enable = true;
  };
}
