#!/bin/bash


sudo pacman -R yay
cd /tmp
echo "Cloning yay-Repo"
git clone https://aur.archlinux.org/yay.git
cd yay
echo "Building package"
makepkg -si
cd ..
# clean /tmp folder
rm -rf yay
echo "yay: Finished Installation"
