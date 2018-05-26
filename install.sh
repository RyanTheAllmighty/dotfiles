# Import the shared *nix functions as they're used by both OSX and Linux
. "$HOME/.dotfiles/includes/nix/functions.sh"

case "$OSTYPE" in
  darwin*)
    . "$HOME/.dotfiles/includes/osx/main.sh"
    ;;
  linux*)
    if [ -f "/mnt/c/pagefile.sys" ]; then
        . "$HOME/.dotfiles/includes/wsl/main.sh"
    else
        . "$HOME/.dotfiles/includes/linux/main.sh"
    fi
    ;;
  *)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
    ;;
esac

if [ ! -f "$HOME/.dotfiles/.system-setup" ]; then
    echo -n "Setup System (y/n)? "
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        setup_system
    else
        touch "$HOME/.dotfiles/.system-setup"
    fi

fi

update_system

install_dotfiles
