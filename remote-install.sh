#!/usr/bin/env bash
mkdir -p "$HOME/.dotfiles" && \
eval "curl -fsSL https://github.com/RyanTheAllmighty/dotfiles/tarball/master | tar -xz -C ~/.dotfiles --strip-components=1"
. "$HOME/.dotfiles/install.sh"
