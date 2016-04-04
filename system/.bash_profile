
# OS

if [ "$(uname -s)" = "Darwin" ]; then
  OS="OSX"
else
  OS=$(uname -s)
fi

# assuming ~/.dotfiles 

DOTFILES_DIR="$HOME/dotfiles"

# Source files

source "$DOTFILES_DIR/system/.alias"
source "$DOTFILES_DIR/system/.env"

# Source OSX files

if [ "$OS" = "OSX" ]; then
	source "$DOTFILES_DIR/osx/.alias"
fi

# Clean up

unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export

export OS DOTFILES_DIR