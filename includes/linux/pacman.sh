function upgrade_packages
{
    sudo pacman -Syu
}

# installs a pacman package (if not already installed) and will answer yes to all questions
function install_pacman_package
{
    sudo pacman -S --needed --no-confirm $@
}

# remove a pacman package
function remove_pacman_package
{
    sudo pacman -Rs --needed --no-confirm $@
}

function install_yaourt_package
{
    yaourt -S --needed --no-confirm $@
}

function install_base_system_packages
{
    install_pacman_package git git-lfs python vim tree speedtest-cli p7zip jre-openjdk jre-openjdk-headless
}

function remove_unused_packages
{
    remove_pacman_package gnome-weather totem uget transmission-gtk gnome-todo lollypop libreoffice-fresh hexchat yelp gnome-maps firefox evolution empathy evince gnome-contacts cheese brasero hplip ms-office-online manjaro-hello

function cleanup_unused_files
{
    rm -f ~/Readme
    rm -rf ~/Public
    rm -rf ~/.cache/evolution
    rm -rf ~/.cache/lollypop
    rm -rf ~/.cache/mozilla
    rm -rf ~/.cache/ms-office-online
    rm -rf ~/.config/evolution
    rm -rf ~/.config/hexchat
    rm -f ~/.config/manjaro-hello.json
    rm -rf ~/.hplip
    rm -rf ~/.jak
    rm -rf ~/.mozilla
}

function install_yaourt
{
    install_pacman_package base-devel yaourt
}

function install_zsh
{
    install_pacman_package zsh

    install_yaourt_package oh-my-zsh-git antigen-git

    add_shell "/usr/bin/zsh"
}

function install_desktop_applications
{
    install_yaourt_package spotify google-chrome visual-studio-code-bin discord gnome-usage postman-bin gitkraken hyper vlc-git plex-media-player
}

function install_docker
{
    install_pacman_package docker

    # enable on boot and start the docker daemon
    sudo systemctl enable --now docker
}

function install_nodejs_tooling
{
    install_yaourt_package nvm

    # source in the init so we can use it to get the latest NVM installed
    source /usr/share/nvm/init-nvm.sh

    nvm install lts/carbon
}

# install development tools needed
function install_development_tools
{
    install_docker

    install_nodejs_tooling

    install_pacman_package aws-cli
}
