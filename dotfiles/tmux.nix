{pkgs, ...}: {
  programs.tmux = {
    enable = true;
  };
  environment.systemPackages = with pkgs.tmuxPlugins; [
    sensible
    tmux-fzf
  ];
}
