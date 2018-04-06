. "$HOME/.dotfiles/includes/nix/functions.sh"
. "$HOME/.dotfiles/includes/linux/pacman.sh"
. "$HOME/.dotfiles/includes/linux/system.sh"

function install_dotfiles
{
    echo Installing Linux dotfiles

    # ask for sudo access now to prevent it later
    get_sudo_access

    # fix grub bootloader
    fix_grub_bootloader

    # upgrade all packages in pacman
    upgrade_packages

    # install some base system packages (such as git, docker etc)
    install_base_system_packages

    # this removes base applications installed that aren't used
    remove_unused_packages

    # remove unused files
    cleanup_unused_files

    # install Trizen (manages AUR builds)
    install_trizen

    # install zsh and related plugins
    install_zsh

    # install desktop applications
    install_desktop_applications

    # install development tools (node, docker, aws, etc)
    install_development_tools
}
