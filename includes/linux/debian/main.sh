. "$HOME/.dotfiles/includes/nix/functions.sh"
. "$HOME/.dotfiles/includes/linux/debian/apt.sh"

# this is only run once
function setup_system
{
    echo Setting up system

    # make sure base system packages are installed
    install_base_system_packages

    touch "$HOME/.dotfiles/.system-setup"
}

# this is run everytime
function update_system
{
    echo Updating system

    # make sure base system packages are installed
    install_base_system_packages

    # upgrade all packages
    upgrade_packages

    # make sure pip packages are installed
    install_pip_packages

    # install zsh and related plugins
    install_zsh
}

function install_dotfiles
{
    echo Installing dotfiles

    mkdir -p "$HOME/.nvm"

    link_file linux/.aliases "$HOME/.aliases"
    link_file linux/.gitconfig "$HOME/.gitconfig"

    link_file nix/.hyper.js "$HOME/.hyper.js"
    link_file nix/.nvm/default-packages "$HOME/.nvm/default-packages"
    link_file nix/.zshrc "$HOME/.zshrc"
    link_file nix/.huskyrc "$HOME/.huskyrc"
}
