# Generate a iso with the work environment

#!/usr/bin/env bash

cd ~/.config/nixos
nix build .#nixosConfigurations.default_installer.config.system.build.isoImage --impure

# The flag is required to mount files into ~/.config

# To inspect the generated iso:
# nix-shell -p nix-tree
# nix-tree ./result

