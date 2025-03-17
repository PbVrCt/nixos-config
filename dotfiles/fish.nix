# [1] https://nixos.wiki/wiki/Fish
{
  config,
  pkgs,
  ...
}: {
  # The interactive shell has to be enabled system wide even if it is configured through home manager [1]
  programs.fish.enable = true;
  users.users.${config.userDefinedGlobalVariables.username} = {
    shell = pkgs.fish;
    useDefaultShell = true;
  };
  # Keep bash as the login shell to avoid POSIX compliance problems [1]
  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}
