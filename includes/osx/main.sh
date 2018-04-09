. "$HOME/.dotfiles/includes/osx/system.sh"
. "$HOME/.dotfiles/includes/osx/homebrew.sh"

# this is only run once
function setup_system
{
    echo Setting up system

    get_sudo_access

    # ask user to enter their git user information
    configure_git_user

    run_system_tweaks

    install_homebrew
    install_command_line_utilities
    install_applications
    install_extra_applications

    install_zsh

    touch "$HOME/.dotfiles/.system-setup"
}

# this is run everytime
function update_system
{
    echo Updating system

    # update brew
    brew update

    # upgrade outdated then cleanup unused
    brew upgrade
    brew cleanup

    # do the same for casks
    brew cask upgrade
    brew cask cleanup
}

function install_dotfiles
{
    echo Installing dotfiles

    link_file nix/.hyper.js "$HOME/.hyper.js"
    link_file nix/.nvm/default-packages "$HOME/.nvm/default-packages"
}
