#!/usr/bin/env bash

# $DOTFILES_DIR = Dir where this dotfiles are installed
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#symlinks
ln -sfv "$DOTFILES_DIR" "$HOME/dotfilesdir"
ln -sfv "$HOME/dotfilesdir/git/.gitconfig" ~

#Tig - linux
echo ""
echo " Installing tig..."
echo ""

sudo apt-get install tig -y

# Fish
echo ""
echo " Installing Fish..."
echo ""

sudo apt-get install software-properties-common python-software-properties -y
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update -y
sudo apt-get install fish=2.2.0-1~trusty -y
if [ ! -d "~/.config/fish/" ]; then
    mkdir -p ~/.config/fish/
fi
sudo chmod -R a+rw /home/eduardoportilho/.config/fish

cp ~/.profile ~/.profile_bf_dot
echo ""                                                         >> ~/.profile
echo "# Change shell to fish"                                   >> ~/.profile
echo "if [ \"$SHELL\" != \"/usr/bin/fish\" ]"                   >> ~/.profile
echo "then"                                                     >> ~/.profile
echo "    export SHELL=\"/usr/bin/fish\""                       >> ~/.profile
echo "    exec /usr/bin/fish -l    # -l: run as a login shell"  >> ~/.profile
echo "fi"                                                       >> ~/.profile

# Oh-My-Fish
echo ""
echo " Installing Oh-My-Fish..."
echo ""
export SHELL="/usr/bin/fish"
exec /usr/bin/fish -l

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
ln -sfv "$HOME/dotfilesdir/fish/init.fish" ~/.config/omf/init.fish
ln -sfv "$HOME/dotfilesdir/fish/custom" ~/.config/omf/custom
omf install agnoster
omf theme agnoster