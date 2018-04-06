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
    sudo pacman -Rsdd --noconfirm $@
}

function install_aur_package
{
    trizen -Sa --needed --noconfirm $@
}

function install_base_system_packages
{
    install_pacman_package git git-lfs python vim tree speedtest-cli p7zip jre8-openjdk jre8-openjdk-headless base-devel
}

function remove_unused_packages
{
    remove_pacman_package gnome-weather totem uget transmission-gtk gnome-todo lollypop libreoffice-fresh hexchat yelp gnome-maps firefox evolution empathy evince gnome-contacts brasero hplip ms-office-online manjaro-hello
}

function install_trizen
{
    mkdir -p /tmp/trizen
    cd /tmp/trizen

    git clone https://aur.archlinux.org/trizen.git
    cd trizen
    makepkg -si --noconfirm

    cd /
    rm -rf /tmp/trizen
}

function install_zsh
{
    install_pacman_package zsh autojump thefuck

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    install_aur_package antigen-git
}

# Discord has some issues at the moment which needs a small workaround
function install_discord
{
    gpg --recv-keys B6C8F98282B944E3B0D5C2530FC3042E345AD05D
    install_aur_package libc++
    install_aur_package discord
}

function install_desktop_applications
{
    install_aur_package hyper-bin
    install_aur_package spotify
    install_aur_package google-chrome
    install_aur_package visual-studio-code-bin
    install_discord
    install_aur_package gnome-usage
    install_aur_package postman-bin
    install_aur_package gitkraken
    install_aur_package vlc-git
    install_aur_package plex-media-player
}

function install_docker
{
    install_pacman_package docker

    # enable on boot and start the docker daemon
    sudo systemctl enable --now docker
}

# install development tools needed
function install_development_tools
{
    install_docker

    install_pacman_package aws-cli
}
