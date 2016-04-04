
# OS

if [ "$(uname -s)" = "Darwin" ]; then
  OS="OSX"
else
  OS=$(uname -s)
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

READLINK=$(which greadlink || which readlink)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return # `exit 1` would quit the shell itself
fi

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