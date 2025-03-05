{
  config,
  pkgs,
  ...
}: {
  systemd.user.services.tmux = {
    enable = true;
    description = "tmux server";
    serviceConfig = {
      Type = "forking";
      Restart = "always";
      ExecStart = "${pkgs.bash}/bin/bash -l -c 'source ${config.system.build.setEnvironment} ; exec ${pkgs.tmux}/bin/tmux start-server'";
      ExecStop = "${pkgs.tmux}/bin/tmux kill-server";
      Environment = [
        "USER=%u"
        "HOME=%h"
      ];
    };
    wantedBy = ["default.target"];
  };
}
