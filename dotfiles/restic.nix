{config, ...}: let
  user = "${config.userDefinedGlobalVariables.username}";
in {
  services.restic.backups = {
    restic-repo = {
      user = "${user}";
      initialize = false;
      repository = "/home/${user}/restic-repo";
      passwordFile = config.sops.secrets."RESTIC_PASSWORD".path;
      paths = [
        "/home/${user}/projects"
        "/home/${user}/vault"
        "/home/${user}/.config/nixos"
        "/home/${user}/.config/keys.txt"
      ];
      pruneOpts = [
        "--keep-daily 3"
        "--keep-weekly 2"
        "--keep-yearly 2"
      ];
      extraBackupArgs = [
        "--exclude='*/.venv'"
        "--exclude='*/node_modules'"
        "--exclude='*.iso'"
        "--compression max"
      ];
      timerConfig = {
        OnCalendar = "12:00";
        RandomizedDelaySec = "5h";
      };
    };
  };
}
