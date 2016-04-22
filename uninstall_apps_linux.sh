#!/usr/bin/env bash

# $DOTFILES_DIR = Dir where this dotfiles are installed
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#symlinks
unlink "$HOME/.gitconfig" ~
unlink "$HOME/dotfilesdir"


#Tig - linux
echo ""
echo " Uninstalling tig..."
echo ""

sudo apt-get remove tig -y


# Oh-My-Fish
echo ""
echo " Uninstalling Oh-My-Fish..."
echo ""
omf destroy

# Fish
echo ""
echo " Uninstalling Fish..."
echo ""

sudo apt-get remove software-properties-common python-software-properties fish -y
sudo rm -rf  ~/.config/fish/

rm ~/.profile
cp ~/.profile_bf_dot ~/.profile
rm ~/.profile_bf_dot