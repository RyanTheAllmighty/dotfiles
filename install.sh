#!/usr/bin/env bash
# Import the shared *nix functions as they're used by both OSX and Linux
. "$HOME/.dotfiles/includes/nix/functions.sh"

case "$OSTYPE" in
  darwin*)
    . "$HOME/.dotfiles/includes/osx/main.sh"
    ;;
  linux*)
    RELEASENAME=`lsb_release -is`
    if [ "$(grep -Ei 'debian|buntu|mint' /etc/*release)" ]; then
        . "$HOME/.dotfiles/includes/linux/debian/main.sh"
    elif [ "$(grep -Ei 'arch' /etc/*release)" ]; then
        . "$HOME/.dotfiles/includes/linux/arch/main.sh"
    elif [ "$(grep -Ei 'rhel|centos|fedora' /etc/*release)" ]; then
        . "$HOME/.dotfiles/includes/linux/rhel/main.sh"
    else
        echo "Unsupported OS type. Exiting" 1>&2
        exit 1
    fi
    ;;
  *)
    echo "Unsupported OS type. Exiting" 1>&2
    exit 1
    ;;
esac

if [ ! -f "$HOME/.dotfiles/.system-setup" ]; then
    setup_system
fi

update_system

install_dotfiles
