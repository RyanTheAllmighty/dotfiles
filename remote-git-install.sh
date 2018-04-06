#!/usr/bin/env bash

SKIPINSTALL=0

# check to see if it's already cloned
if [ -d "$HOME/.dotfiles" ]; then
    if [ -d "$HOME/.dotfiles/.git" ]; then
        SKIPINSTALL=1

        printf "Repository already exists, pulling latest changes\n\n"

        cd "$HOME/.dotfiles"

        # stash any changes, pull latest changes, then pop the stash back
        git stash
        git pull
        git stash pop
    fi
fi

if [ $SKIPINSTALL = 0 ]; then
    # install pacapt to install git
    wget -O /tmp/pacapt https://github.com/icy/pacapt/raw/ng/pacapt
    chmod 755 /tmp/pacapt

    # install git
    sudo /tmp/pacapt -S --noconfirm git

    # remove pacapt
    rm -rf /tmp/pacapt

    # remove existing directory
    rm -rf "$HOME/.dotfiles"

    # clone the repository from https
    git clone --branch master https://github.com/RyanTheAllmighty/dotfiles.git "$HOME/.dotfiles"

    cd "$HOME/.dotfiles"

    if [[ `git remote get-url origin` = "https://github.com/RyanTheAllmighty/dotfiles.git" ]]; then
        printf "\n\nUsing https git url. Please consider using the ssh one\n\n"
        printf "git remote set-url origin git@github.com:RyanTheAllmighty/dotfiles.git\n\n"
        printf "Press enter to continue\n"
        read
    fi
fi

# run the installer
. "$HOME/.dotfiles/install.sh"
