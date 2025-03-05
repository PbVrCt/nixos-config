{
  config,
  lib,
  ...
}: {
  options = with lib;
  with types; {
    userDefinedGlobalVariables = {
      mainUsername = mkOption {
        default = "mainuser";
        type = str;
      };
      mainUserGroups = mkOption {
        default = ["networkmanager" "wheel" "input" "uinput" "docker" "video" "dialout" "plugdev" "storage" "adbusers" "audio"];
        type = listOf str;
      };
      systemStateVersion = mkOption {
        default = "24.11";
        type = str;
      };
      homeManagerStateVersion = mkOption {
        default = "24.11";
        type = str;
      };
    };
  };
}
