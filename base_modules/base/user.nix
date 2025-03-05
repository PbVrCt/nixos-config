{config, ...}: {
  users.users.${config.userDefinedGlobalVariables.mainUsername} = {
    isNormalUser = true;
    extraGroups = config.userDefinedGlobalVariables.mainUserGroups;
  };
}
