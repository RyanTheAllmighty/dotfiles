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
