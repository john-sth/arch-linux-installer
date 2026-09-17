#!/bin/bash


sudo pacman -R yay
cd /tmp
echo "Cloning yay-Repo"
git clone https://aur.archlinux.org/yay.git
chown nobody:nobody yay
cd yay
echo "Building package"
sudo -u nobody makepkg -si
#makepkg -si
cd ..
# clean /tmp folder
rm -rf yay
echo "yay: Finished Installation"
