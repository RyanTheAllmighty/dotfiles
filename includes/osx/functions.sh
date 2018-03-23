function add_shell
{
    sudo bash -c "echo $1 >> /etc/shells"
}

function get_sudo_access
{
    sudo -v
}
