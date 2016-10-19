#!/usr/bin/env bash

# $DOTFILES_DIR = Dir where this dotfiles are installed
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#symlinks
ln -sfv "$DOTFILES_DIR" "$HOME/dotfilesdir"
ln -sfv "$HOME/dotfilesdir/git/.gitconfig" ~

# Install Homebrew
# http://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Tig
brew install tig

# Install Fish
# https://hackercodex.com/guide/install-fish-shell-mac-ubuntu/
brew install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Install Oh-My-Fish
curl -L http://get.oh-my.fish | fish
ln -sfv "$HOME/dotfilesdir/fish/init.fish" ~/.config/omf/init.fish
ln -sfv "$HOME/dotfilesdir/fish/custom" ~/.config/omf/custom

# OMF Themes (choose 1)
# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md
# omf install agnoster # Require https://github.com/powerline/powerline
# omf install sushi
# omf install robbyrussell
# omf install pure

# Autojump
brew install autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish