# Add a secret to sops

#!/usr/bin/env bash
export SOPS_AGE_KEY_FILE="$HOME/.config/keys.txt"
sops ~/.config/nixos/hosts/default/sops_secrets.yaml
echo 'Remember to expose the secret with sops-nix. See sopsnix.nix'
