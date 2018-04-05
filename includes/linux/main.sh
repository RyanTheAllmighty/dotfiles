. "$HOME/.dotfiles/includes/nix/functions.sh"

function install_dotfiles
{
    echo Installing Linux dotfiles

    get_sudo_access

    run_system_tweaks
}
