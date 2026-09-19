#!/usr/bin/env sh

######################################################################
# @author      : john (john@$HOSTNAME)
# @file        : post_install
# @created     : Samstag Sep 19, 2026 17:45:01 CEST
#
# @description : 
######################################################################



cd $HOME

# create directories 
mkdir -p private music downloads documents pictures 

# clone dotfiles and symlink them with stow 
git clone https://github.com/john-sth/arch-linux-rice $HOME/.dotfiles
cd dotfiles
stow . 
