#!/usr/bin/env bash

# ==========================================
# ==========================================

# write to stderr
set -x 

# -e: if a command fails, the shell immediately exits 
# -o: write to stdout
# if any command in a pipeline fails, that return code will be used as the return code of the whole pipeline. 
set -eo pipefail

echo -ne "
starting install
"

# 
( ./00_check.sh )|& tee 00_check.log


( ./01_mount-partitions.sh )|& tee 01_mount-partitions.log


( ./02_pacstrap.sh )|& tee 02_pacstrap.log
( ./03_prepare-for-arch-chroot.sh )|& tee 03_prepare-for-arch-chroot.log
( arch-chroot /mnt /root/04_configuration.sh )|& tee 04_configuration.log
( arch-chroot /mnt /root/05_bootloader.sh )|& tee 05_bootloader.log
( arch-chroot /mnt /root/06_user.sh )|& tee 06_user.log
mkdir -p /mnt/home/bettini/install-logs
cp -v *.log /mnt/home/bettini/install-logs/
chown -R 1000:1000 /mnt/home/bettini/install-logs/

echo -ne "
install finished!
"
