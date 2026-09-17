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
    # vicinae 
    curl -fsSL https://vicinae.com/install | bash
}


function main() {
    ## install yay for AUR package installation
    sh ./configurations/install_yay.sh
    install_packages
    post_install
}

main "$@"


