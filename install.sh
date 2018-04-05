case "$OSTYPE" in
  darwin*)
    . "$HOME/.dotfiles/includes/osx/main.sh"
    ;;
  linux*)
    . "$HOME/.dotfiles/includes/linux/main.sh"
    ;;
  msys*)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
    ;;
  *)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
    ;;
esac

install_dotfiles
