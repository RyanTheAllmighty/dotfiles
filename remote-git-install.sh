#!/usr/bin/env bash

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

# change to the SSH origin for key pushing
git remote set-url origin git@github.com:RyanTheAllmighty/dotfiles.git

# run the installer
. "$HOME/.dotfiles/install.sh"
