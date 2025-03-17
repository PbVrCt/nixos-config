{pkgs, ...}: {
  # To find the keyboard name:
  # nix-shell p usbutils
  # lsusb
  services.udev.extraRules = ''
    KERNEL=="event*", SUBSYSTEM=="input", ATTRS{name}=="keyclicks w-corne-choc(STM32) Keyboard", SYMLINK+="input/corne"
  '';
  services.kanata = {
    package = pkgs.kanata-with-cmd;
    enable = true;
    keyboards.default = {
      devices = [];
      configFile = builtins.toPath ./kanata/kanata.kbd;
    };
  };
}
