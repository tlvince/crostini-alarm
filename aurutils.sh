#!/bin/sh

cd /tmp
curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/aurutils.tar.gz
tar xfv aurutils.tar.gz
cd aurutils
gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
makepkg -s
sudo pacman -U aurutils-*.pkg.tar.xz

sudo tee << EOF >/etc/pacman.d/custom
[options]
CacheDir = /var/cache/pacman/pkg
CacheDir = /var/cache/pacman/custom
CleanMethod = KeepCurrent

[custom]
SigLevel = Optional TrustAll
Server = file:///var/cache/pacman/custom
EOF

echo 'Include = /etc/pacman.d/custom' | sudo tee -a /etc/pacman.conf
sudo install -d /var/cache/pacman/custom -o $USER
repo-add /var/cache/pacman/custom/custom.db.tar
sudo pacman -Syu

aursync aurutils
sudo pacman -R aurutils
sudo pacman -S aurutils
