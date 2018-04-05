. "$HOME/.dotfiles/includes/osx/functions.sh"
. "$HOME/.dotfiles/includes/osx/system.sh"
. "$HOME/.dotfiles/includes/osx/homebrew.sh"

function install_dotfiles
{
    echo Installing OSX dotfiles

    get_sudo_access

    run_system_tweaks

    install_homebrew
    install_command_line_utilities
    install_applications
    install_extra_applications

    install_zsh
}
