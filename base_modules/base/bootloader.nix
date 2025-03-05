{pkgs, ...}: {
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  console.earlySetup = true;

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  # boot.loader.grub = {
  #  enable = true;
  #  version = 2;
  #  efiSupport = true;
  #  device = "nodev";
  # };
  # boot.loader.efi.canTouchEfiVariables = true;

  # # Fix for Plasma 6 on intel CPUs
  # # https://discourse.nixos.org/t/blinking-underscore-when-system-starts-up/36783/15
  # # Quote: The main issue has to do with intel arcs only being supported in kernel 6, which nixos does not use by default.
  # boot.initrd.kernelModules = ["i915"];
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # boot.kernelParams = [
  #   "nvidia-drm.fbdev=1"
  #   "NVreg_EnableGpuFirmware=0"
  # ];
}
