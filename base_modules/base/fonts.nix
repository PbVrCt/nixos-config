{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # nerd-fonts.hack
      # nerd-fonts.jetbrains-mono
      # nerd-fonts.symbols-only
      (nerdfonts.override {fonts = ["Hack" "JetBrainsMono" "NerdFontsSymbolsOnly"];})
      noto-fonts-emoji
      # Japanese
      ipafont
      kochi-substitute
    ];
    fontconfig = {
      defaultFonts = {
        emoji = ["Noto Color Emoji"];
        monospace = ["Hack Nerd Font" "JetBrainsMono Nerd Font"];
        sansSerif = ["Hack Nerd Font" "JetBrainsMono Nerd Font"];
        serif = ["Hack Nerd Font" "JetBrainsMono Nerd Font"];
      };
    };
  };
}
