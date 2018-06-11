#!/bin/sh

vsh termina
mkdir /tmp/alarm && cd /tmp/alarm
curl -L http://os.archlinuxarm.org/os/ArchLinuxARM-aarch64-latest.tar.gz
curl -O https://raw.githubusercontent.com/tlvince/crostini-alarm/master/metadata.yaml
tar cf metadata.tar metadata.yaml
lxc image import --alias alarm metadata.tar ArchLinuxARM-aarch64-latest.tar.gz
cd && rm -rf /tmp/alarm

# systemctl user workaround
lxc profile set default security.syscalls.blacklist "keyctl errno 38"

lxc launch alarm alarm
lxc exec alarm -- bash

pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu
pacman -S base-devel

# scoll down and uncomment the wheel group
visudo
usermod -a -G wheel alarm
exit
