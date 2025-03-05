{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = with pkgs; [
        fcitx5-rime
        fcitx5-mozc
        fcitx5-chinese-addons
      ];
    };
  };
  home-manager.users.${config.userDefinedGlobalVariables.mainUsername}.home.file = {
    ".config/fcitx5/config".source = ../../modules/fcitx5/fcitx5;
    ".config/fcitx5/profile".source = ../../modules/fcitx5/profile;
    ".config/fcitx5/profile".force = true;
  };
}
