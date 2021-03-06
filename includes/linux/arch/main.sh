. "$HOME/.dotfiles/includes/nix/functions.sh"
. "$HOME/.dotfiles/includes/linux/manjaro/pacman.sh"
. "$HOME/.dotfiles/includes/linux/manjaro/system.sh"
. "$HOME/.dotfiles/includes/nix/pip.sh"

# this is only run once
function setup_system
{
    echo Setting up system

    # this removes base applications installed that aren't used
    remove_unused_packages

    # upgrade all packages in pacman
    upgrade_packages

    # install some base system packages (such as git, docker etc)
    install_base_system_packages

    # remove unused files
    cleanup_unused_files

    # install zsh and related plugins
    install_zsh

    # install desktop applications
    install_desktop_applications

    # install other applications
    install_other_applications

    # install development tools (node, docker, aws, etc)
    install_development_tools

    # install PIP applications
    install_pip_applications

    # install PrettyPing
    install_prettyping

    # install appearance tweaks
    install_appearance_tweaks

    # make sure bluetooth headsets work
    configure_bluetooth_headset

    touch "$HOME/.dotfiles/.system-setup"
}

# this is run everytime
function update_system
{
    echo Updating system

    # make sure base system packages are installed
    install_base_system_packages

    # upgrade all packages in pacman
    upgrade_packages

    # disable_unused_services
    disable_unused_services

    # make sure bin is latest
    install_local_bin linux/headphoneconnect
}

function install_dotfiles
{
    echo Installing dotfiles

    link_file linux/.aliases "$HOME/.aliases"
    link_file linux/.gitconfig "$HOME/.gitconfig"

    link_file nix/.hyper.js "$HOME/.hyper.js"
    link_file nix/.nvm/default-packages "$HOME/.nvm/default-packages"
    link_file nix/.zshrc "$HOME/.zshrc"
    link_file nix/.huskyrc "$HOME/.huskyrc"
}
