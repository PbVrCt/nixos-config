{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ## FLAKES - I try to avoid them, and rely on nix-shells whenver I can
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ##
  };
  outputs = {...} @ inputs: {
    specialArgs = {inherit inputs;};
    ## HOSTS
    # sudo nixos-rebuild switch --flake ~/.config/nixos/#default
    nixosConfigurations = {
      default = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/default/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.sops-nix.nixosModules.sops
        ];
      };
      rpi0w = inputs.nixpkgs.lib.nixosSystem {
        system = "armv6l-linux";
        modules = [./hosts/rpi0w/rpi_configuration.nix];
      };
      ## INSTALLER
      default_installer = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/default/configuration_iso.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.sops-nix.nixosModules.sops
          "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
          (
            {
              config,
              lib,
              ...
            }: {
              environment.systemPackages = [];
              isoImage = {
                isoName = lib.mkForce "my-nixos.iso";
                contents = [
                  {
                    source = /home/nixos/.config/nixos;
                    target = "/home/nixos/.config/nixos";
                  }
                  {
                    source = /home/nixos/restic-repo;
                    target = "/home/nixos/restic-repo";
                  }
                ];
                makeEfiBootable = true;
                makeUsbBootable = true;
                squashfsCompression = "xz";
                storeContents = [config.system.build.toplevel];
                includeSystemBuildDependencies = true; # Works offline
              };
              system.activationScripts.makeScriptsExecutable.text = ''
                chmod +x /home/nixos/.config/nixos/scripts/**/*
              '';
              boot.supportedFilesystems = [
                "ext4"
                "vfat"
              ];
            }
          )
        ];
      };
    };
  };
}
