#!/usr/bin/env bash

# $DOTFILES_DIR = Dir where this dotfiles are installed
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#symlinks
ln -sfv "$DOTFILES_DIR" "$HOME/dotfilesdir"
ln -sfv "$HOME/dotfilesdir/git/.gitconfig" ~
ln -sfv "$HOME/dotfilesdir/fish/init.fish" ~/.config/omf/init.fish
ln -sfv "$HOME/dotfilesdir/fish/custom" ~/.config/omf/custom