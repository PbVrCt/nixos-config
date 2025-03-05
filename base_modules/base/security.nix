{
  security.polkit.enable = true;
  security.rtkit.enable = true;
  boot.kernel.sysctl."kernel.yama.ptrace_scope" = 0;
  security.sudo.configFile = ''
    %wheel ALL=(ALL) ALL
  '';
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
