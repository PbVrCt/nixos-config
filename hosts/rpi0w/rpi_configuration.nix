# UNFINISHED
{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  nixpkgs.crossSystem = lib.systems.elaborate lib.systems.examples.raspberryPi;
  ## PROGRAM CONFIGURATION
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image.nix>
  ];

  ## PROGRAM INSTALLATION.
  nixpkgs.hostPlatform = "armv6l-linux";

  environment.systemPackages = with pkgs; [
    libraspberrypi
    libgpiod
    gpio-utils
    i2c-tools
    screen
    vim
    git
    bottom
    (python39.withPackages (ps:
      with ps; [
        adafruit-pureio
        pyserial
      ]))
  ];

  hardware.i2c.enable = true;

  users = {
    extraGroups = {
      gpio = {};
    };
    extraUsers.pi = {
      isNormalUser = true;
      initialPassword = "raspberry";
      extraGroups = ["wheel" "networkmanager" "dialout" "gpio" "i2c"];
    };
  };
  services.getty.autologinUser = "pi";

  services.openssh = {
    enable = true;
    passwordAuthentication = true;
    settings.PermitRootLogin = "yes";
  };

  services.udev = {
    extraRules = ''
      KERNEL=="gpiochip0*", GROUP="gpio", MODE="0660"
    '';
  };

  system.stateVersion = "nixos-unstable";

  networking = {
    wireless = {
      enable = true;
      networks = {
        "SSID" = {
          psk = "PASSWORD";
        };
      };
    };
  };

  boot = {
    loader = {
      grub.enable = false;
      # Enables the generation of /boot/extlinux/extlinux.conf
      generic-extlinux-compatible.enable = true;
      raspberryPi = {
        enable = true;
        version = 0;
        # firmwareConfig = ''dtparam=i2c=on'';
      };
    };

    kernelPackages = pkgs.linuxPackages_rpi0;
    consoleLogLevel = lib.mkDefault 7;
    # kernelModules = [
    #   "i2c-dev"
    # ];

    # prevent `modprobe: FATAL: Module ahci not found`
    initrd.availableKernelModules = pkgs.lib.mkForce [
      "mmc_block"
    ];
  };

  sdImage = {
    populateRootCommands = "";
    populateFirmwareCommands = with config.system.build; ''
      ${installBootLoader} ${toplevel} -d ./firmware
    '';
    firmwareSize = 64;
  };

  hardware = {
    # needed for wlan0 to work (https://github.com/NixOS/nixpkgs/issues/115652)
    enableRedistributableFirmware = pkgs.lib.mkForce false;
    firmware = with pkgs; [
      raspberrypiWirelessFirmware
    ];
  };
}
