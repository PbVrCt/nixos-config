#!/usr/bin/env bash
mkdir -p /home/nixos/.config/nixos
cp /iso/home/nixos/.config/nixos /home/nixos/.config/nixos
cp /iso/home/nixos/.config/restic-repo /home/nixos/restic-repo

sudo nixos-generate-config --force
sudo cp /etc/nixos/hardware-configuration.nix /home/nixos/.config/nixos/hosts/default/hardware-configuration.nix --force

