function add_shell
{
    # Add the shell if it doesn't already exist in the /etc/shells file
    if ! grep -Fxq "$1" /etc/shells
    then
        sudo bash -c "echo $1 >> /etc/shells"
    fi
}

function set_shell
{
    sudo chsh -s $1
}

function get_sudo_access
{
    sudo -v
}

function link_file
{
    ln -sf "$HOME/.dotfiles/files/$1" $2
}

function install_bin
{
    chmod +x "$HOME/.dotfiles/bin/$1"
    cp -f "$HOME/.dotfiles/bin/$1" /usr/local/bin/${1##*/}
}
