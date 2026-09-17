#!/usr/bin/env sh

# ====================================================================
# @author      : john
# @file        : install_programs
# @created     : Donnerstag Sep 17, 2026 15:51:38 CEST
#
# @description : installs needed programs from pacman and aur package registries
# ====================================================================


function install_packages() {
    # install packages via pacman
    readarray -t packages < <(grep -v '^ *#' < ./packages/pacman)
    pacman -Syu --noconfirm --needed "${packages[@]}"


    # install packages via AUR 
    readarray -t packages_aur < <(grep -v '^ *#' < ./packages/aur)
    yay -Syu --noconfirm --needed "${packages_aur[@]}"
}



function post_install() {
    # install zed
    curl -f https://zed.dev/install.sh | sh
    
    # install netbird
    curl -fsSL https://pkgs.netbird.io/install.sh | sh
    #netbird up
}


function main() {
    ## install yay for AUR package installation
    sh $SCRIPTS/install_yay
    install_packages
    post_install
}

main "$@"


