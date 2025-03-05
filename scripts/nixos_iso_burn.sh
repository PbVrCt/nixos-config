# Burns the iso from nix build into a device

#!/usr/bin/env bash

# Get available USB devices (excluding internal drives)
USB_DEVICES=$(lsblk -d -o NAME,SIZE,TYPE,TRAN | grep "usb" | awk '{print "/dev/"$1 " ("$2")"}')

if [ -z "$USB_DEVICES" ]; then
    echo "No USB devices found!"
    exit 1
fi

# Use gum to choose USB device
echo "Select USB device to write to:"
USB=$(echo "$USB_DEVICES" | gum choose | cut -d' ' -f1)

if [ -z "$USB" ]; then
    echo "No device selected!"
    exit 1
fi

# Confirm selection
echo "You selected: $USB"
echo "This will ERASE ALL DATA on this device!"
gum confirm "Do you want to continue?" || exit 1

# Perform dd operation
echo "Writing ISO to $USB..."
sudo dd if=/home/nixos/.config/$USER/result/iso/my-nixos.iso of=$USB bs=4M status=progress conv=fdatasync

# Eject USB after completion
echo "Writing complete. Ejecting USB..."
sudo eject $USB

echo "Done!"
