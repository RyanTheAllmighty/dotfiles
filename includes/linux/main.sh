. "$HOME/.dotfiles/includes/nix/functions.sh"
. "$HOME/.dotfiles/includes/linux/pacman.sh"
. "$HOME/.dotfiles/includes/linux/system.sh"

# this is only run once
function setup_system
{
    echo Setting up system

    # ask for sudo access now to prevent it later
    get_sudo_access

    # ask user to enter their git user information
    configure_git_user

    # fix grub bootloader
    fix_grub_bootloader

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

    # install development tools (node, docker, aws, etc)
    install_development_tools

    # install system tweaks
    # install_system_tweaks

    touch "$HOME/.dotfiles/.system-setup"
}

# this is run everytime
function update_system
{
    echo Updating system

    # upgrade all packages in pacman
    upgrade_packages
}

function install_dotfiles
{
    echo Installing dotfiles

    link_file linux/.aliases "$HOME/.aliases"
    link_file linux/.hyper.js "$HOME/.hyper.js"
    link_file linux/.zshrc "$HOME/.zshrc"
}

function install_system_tweaks
{
    restore_dconf_settings
}
