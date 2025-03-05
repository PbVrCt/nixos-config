{config, ...}: {
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.programs.git = {
    enable = true;
    ignores = [];
    extraConfig = {
      push = {autoSetupRemote = true;};
      delta = {
        navigate = true;
        # side-by-side = false;
      };
      core = {pager = "delta";};
      interactive = {diffFilter = "delta --color-only";};
      merge = {conflictstyle = "zdiff3";};
      color = {ui = true;};
      pager = {difftool = true;};
      diff = {tool = "difftastic";};
      difftool = {prompt = false;};
      include = {
        path = "/home/${config.userDefinedGlobalVariables.mainUsername}/.config/git/credentials";
      };
    };
  };
}
