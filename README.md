```
        a8888b.           Host        -  mainuser@nixos
       d888888b.          Machine     -  LENOVO ThinkPad X1 Carbon 5th 20HQS73D00
       8P"YP"Y88          Kernel      -  6.6.75
       8|o||o|88          Distro      -  NixOS 24.11 (Vicuna)
       8'    .88          DE          -  River
       8`._.' Y8.         Packages    -  3 (cargo), 6032 (nix)
      d/      `8b.        Shell       -  fish
     dP        Y8b.       Terminal    -  tmux: server
    d8:       ::88b.      Brightness  -  100%
   d8"         'Y88b      Resolution  -  1920x1080
  :8P           :888      Uptime      -  20m
   8a.         _a88P      CPU         -  Intel® Core™ i7-7500U CPU @ 2.70GHz (4)
 ._/"Yaa     .| 88P|      CPU Load    -  14%
 \    YP"    `|     `.    Memory      -  2.6 GB / 7.9 GB
 /     \.___.d|    .'     Battery     -  59% & Charging
 `--..__)     `._.'       Disk Space  -  156.2 GB / 250.4 GB
```

# Goals, in order:

1. Simple: Minimize cognitive load, minimize configuration.
2. Effective: Get close to the best developer experience available.
3. Reliable: Favor well stablished technologies, favor software with less dependencies, favor lightweight, favor UNIX philosophy.
4. Reproducible: Be able to set up the work environment in a new machine quickly.
5. Minimize maintenance: Do the configuration effort upfront.

# Usage

Read the `scripts/`

## Api key management

The api keys are encrypted.
To use them, place the decryption key at ~/.config/keys.txt. It looks like this:

```keys.txt
AGE-SECRET-KEY-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Then do:

```cat /run/secrets/$SECRET```

# My experience with NixOs, coming from Ubuntu:

I started using nixos on summer 2024. Following trends, I set up flakes and home manager. After 8 months, my experience is that:

- Flake features require effort to set up.
- Home manager requires ocasional troubleshooting. The only thing I use it for is to symlink dotfiles.
- Vanilla nixos works without much hassle. Makes installing software easy and fulfils goals 4 and 5. It has been a big improvement over Ansible scripts.

# To improve:

- Prune: Remove old config options, remove unused programs, clean up scripts.

- Try nixos speciations.

- Minimize flake usage. (As a software consumer, but as a software author consider using flakes for tracking sofware dependencies.)

- Replace Home Manager for Stow.

## Consider remote development:

Benefits:
- Leaving the thing always on circunvents restoring sessions. Minimizes cognitive load.
- Simplifies keeping a unifed config across devices. But that is not really a big deal, since:
    1. My config shouldn't change much.
    2. I have automated config backups and I primarily use one laptop.

Look into:
- Desktop/consumer VPS providers.
- https://github.com/tailscale/tailscale    
- https://github.com/nix-community/nixos-anywhere

## Get these working:

- Screenshots
    https://github.com/waycrate/wayshot
- Gif recording
- Screen recording
    https://github.com/xlmnxp/blue-recorder
- Screen sharing
    https://github.com/russelltg/wl-screenrec
    https://github.com/ammen99/wf-recorder
    https://github.com/asciinema/asciinema
    https://soyuka.me/make-screen-sharing-wayland-sway-work/
    https://github.com/emersion/xdg-desktop-portal-wlr

## Check these out:

- https://github.com/sirwart/ripsecrets
- https://github.com/nivekuil/rip
- https://github.com/dlvhdr/gh-dash
- https://github.com/espanso/espanso
