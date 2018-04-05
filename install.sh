# Import the shared *nix functions as they're used by both OSX and Linux
. "$HOME/.dotfiles/includes/nix/functions.sh"

case "$OSTYPE" in
  darwin*)
    . "$HOME/.dotfiles/includes/osx/main.sh"
    ;;
  linux*)
    . "$HOME/.dotfiles/includes/linux/main.sh"
    ;;
  *)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
    ;;
esac

install_dotfiles
