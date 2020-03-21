#!/usr/bin/env bash
# Import the shared *nix functions as they're used by both OSX and Linux
. "$HOME/.dotfiles/includes/nix/functions.sh"

case "$OSTYPE" in
  darwin*)
    . "$HOME/.dotfiles/includes/osx/main.sh"
    ;;
  linux*)
    if [ -d "/mnt/c/Windows" ]; then
        . "$HOME/.dotfiles/includes/wsl/main.sh"
    else
        RELEASENAME=`lsb_release -is`
        if [ "$RELEASENAME" == 'Ubuntu' ] || [ "$RELEASENAME" == 'Debian' ]; then
            . "$HOME/.dotfiles/includes/linux/ubuntu/main.sh"
        elif [ "$RELEASENAME" == 'ManjaroLinux' ]; then
            . "$HOME/.dotfiles/includes/linux/manjaro/main.sh"
        else
            echo "Unsupported OS type. Exiting" 1>&2
        fi
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
