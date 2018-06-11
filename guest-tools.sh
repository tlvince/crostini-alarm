#!/bin/sh

sudo pacman -S xorg-apps xdg-utils xorg-server-xwayland

# 2.24.0 currently prevents xwayland from starting, so downgrade with:
sudo pacman -S https://archive.archlinux.org/repos/2018/06/06/extra/os/x86_64/xkeyboard-config-2.23.1-3-any.pkg.tar.xz

# Bug fixes
sudo mkdir /root/.config
sudo pacman -S gtk3

# For testing
sudo pacman -S xorg-xclock

# Finally
aursync cros-container-guest-tools-git
sudo pacman -Syu cros-container-guest-tools-git
