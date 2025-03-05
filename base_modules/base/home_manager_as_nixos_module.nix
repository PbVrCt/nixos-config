{
  config,
  inputs,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    users.${config.userDefinedGlobalVariables.mainUsername} = {
      programs.home-manager.enable = true;
      home = {
        username = config.userDefinedGlobalVariables.mainUsername;
        homeDirectory = "/home/${config.userDefinedGlobalVariables.mainUsername}";
        stateVersion = config.userDefinedGlobalVariables.systemStateVersion;
      };
    };
  };
}
