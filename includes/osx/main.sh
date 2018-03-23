. ./functions.sh
. ./homebrew.sh

function install_dotfiles
{
    echo Installing OSX dotfiles

    get_sudo_access

    install_homebrew
    install_command_line_utilities
    install_applications
    install_extra_applications

    install_zsh
}
