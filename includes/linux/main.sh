. "$HOME/.dotfiles/includes/nix/functions.sh"
. "$HOME/.dotfiles/includes/linux/pacman.sh"

function install_dotfiles
{
    echo Installing Linux dotfiles

    # ask for sudo access now to prevent it later
    get_sudo_access

    # upgrade all packages in pacman
    upgrade_packages

    # install some base system packages (such as git, docker etc)
    install_base_system_packages

    # this removes base applications installed that aren't used
    remove_unused_packages

    # install Yaourt
    install_yaourt

    # install zsh and related plugins
    install_zsh

    # install desktop applications
    install_desktop_applications

    # install NodeJS tooling
    install_nodejs_tooling

    # system tweaks
    run_system_tweaks
}
