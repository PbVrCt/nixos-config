{
  # To find the keyboard name:
  #   nix-shell p usbutils
  #   lsusb
  services.udev.extraRules = ''
    KERNEL=="event*", SUBSYSTEM=="input", ATTRS{name}=="keyclicks w-corne-choc(STM32) Keyboard", SYMLINK+="input/corne"
  '';
  hardware.uinput.enable = true;
  services.kanata = {
    enable = true;
    keyboards.default = {
      devices = [];
      configFile = builtins.toPath ./kanata.kbd;
    };
  };
}
