case "$OSTYPE" in
  darwin*)
    . ./includes/osx/main.sh
    ;;
  linux*)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
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
