function upgrade_packages
{
    sudo pacman -Syu --noconfirm
}

# installs a pacman package (if not already installed) and will answer yes to all questions
function install_pacman_package
{
    sudo pacman -S --needed --noconfirm $@
}

# remove a pacman package
function remove_pacman_package
{
    sudo pacman -Rsn --noconfirm $@
}

function install_aur_package
{
    yaourt -S --needed --noconfirm $@
}

function install_base_system_packages
{
    install_pacman_package git git-lfs python vim tree speedtest-cli p7zip jre8-openjdk jre8-openjdk-headless base-devel vlc yaourt x11-ssh-askpass iotop bat
}

function remove_unused_packages
{
    # manjaro gnome specific
    remove_pacman_package gnome-weather
    remove_pacman_package totem
    remove_pacman_package uget
    remove_pacman_package transmission-gtk
    remove_pacman_package gnome-todo
    remove_pacman_package lollypop
    remove_pacman_package hexchat
    remove_pacman_package yelp
    remove_pacman_package gnome-maps
    remove_pacman_package evolution
    remove_pacman_package empathy
    remove_pacman_package evince
    remove_pacman_package gnome-contacts
    remove_pacman_package brasero

    # manjaro kde specific
    remove_pacman_package inkscape
    remove_pacman_package kget
    remove_pacman_package konversation
    remove_pacman_package qbittorrent
    remove_pacman_package thunderbird
    remove_pacman_package cantana
    remove_pacman_package yakuake

    # crapware
    remove_pacman_package ms-office-online
    remove_pacman_package manjaro-hello
    remove_pacman_package libreoffice-fresh
    remove_pacman_package firefox
    remove_pacman_package hplip
    remove_pacman_package imagewriter
}

function install_zsh
{
    install_pacman_package zsh autojump thefuck

    install_aur_package oh-my-zsh-git
    install_aur_package antigen-git
}

# installs spotify and playerctl so we can use global media keys to control
function install_spotify
{
    install_aur_package spotify
    install_pacman_package playerctl
}

# Discord has some issues at the moment which needs a small workaround
function install_discord
{
    gpg --recv-keys B6C8F98282B944E3B0D5C2530FC3042E345AD05D
    install_aur_package libc++
    install_aur_package discord

    # autostart on login
    ln -sf /usr/share/applications/Discord.desktop  ~/.config/autostart/Discord.desktop
}

function install_albert
{
    install_aur_package albert-lite

    # autostart on login
    ln -sf /usr/share/applications/albert.desktop  ~/.config/autostart/albert.desktop
}

function install_keybase
{
    install_aur_package keybase-bin
    run_keybase

    # remove the autostart entry
    rm -f ~/.config/autostart/keybase_autostart.desktop
}

function install_desktop_applications
{
    install_aur_package hyper-bin
    install_spotify
    install_aur_package google-chrome
    install_aur_package visual-studio-code-bin
    install_discord
    install_aur_package postman-bin
    install_aur_package plex-media-player
    install_aur_package ratslap
    install_aur_package wakatime
    install_albert
    install_keybase
}

function install_other_applications
{
    install_aur_package otf-fira-code
}

function install_docker
{
    install_pacman_package docker

    # enable on boot and start the docker daemon
    sudo systemctl enable --now docker
}

# installs a fake node and npm package since we use nvm to manage these
function install_nodejs_fake
{
    mkdir -p /tmp/nodejs-fake
    cd /tmp/nodejs-fake

    curl -L https://github.com/RyanTheAllmighty/archlinux-packages/archive/master.tar.gz | tar xvz archlinux-packages-master/packages/nodejs-fake --strip 3

    makepkg -sif --noconfirm --needed

    rm -rf /tmp/nodejs-fake
}

# install development tools needed
function install_development_tools
{
    install_docker

    mkdir -p "$HOME/.nvm"
    install_nodejs_fake

    install_pacman_package aws-cli
    install_pacman_package yarn
}

function install_appearance_tweaks
{
    install_pacman_package arc-gtk-theme arc-kde papirus-icon-theme
}
