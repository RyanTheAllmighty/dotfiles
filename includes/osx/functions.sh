function add_shell
{
    sudo bash -c "echo $1 >> /etc/shells"
}

function set_shell
{
    sudo chsh -s $1
}

function get_sudo_access
{
    sudo -v
}
