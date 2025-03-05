# [1] https://nixos.wiki/wiki/Fish
{
  config,
  pkgs,
  ...
}: {
  # The interactive shell has to be enabled system wide even if it is configured through home manager [1]
  programs.fish.enable = true;
  users.users.${config.userDefinedGlobalVariables.mainUsername} = {
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
  #
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.programs.fish = {
    enable = true;
    shellInit = ''
      set -Ux EDITOR hx
      set -g fish_key_bindings fish_vi_key_bindings
      set fish_greeting # Disable greeting
      function fish_mode_prompt; end # Disable mode prompt

      set fish_cursor_default block blink
      set fish_cursor_insert line blink
      set fish_cursor replace_one underscore blink
      set fish_cursor_replace underscore
      set fish_cursor_external line
      set fish_cursor_visual block

      function postexec --on-event fish_postexec
        echo
        echo
      end
    '';
    shellAliases = {
      n = "yazi";
    };
    shellAbbrs = {
    };
    functions = {
      fish_prompt = ''
        ## Last command status
        set -l last_status $status
        # Nix shell status
        set -l nix_shell_info (
            if test -n "$IN_NIX_SHELL"
                echo -n "(nix-shell) "
            end
        )
        ## Git branch status
        set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
        set -l git_info ""
        if test -n "$git_branch"
            set git_info "($git_branch) "
        end
        ##
        set_color 5277C3
        echo -n -s "$nix_shell_info"
        set_color F05032
        echo -n "$git_info"
        set_color a8a8a8
        echo -n (prompt_pwd)
        echo -n " > "
      '';
    };
  };
}
