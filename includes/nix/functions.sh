function sudo
{
    [[ $EUID = 0 ]] || set -- command sudo "$@"
    "$@"
}

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
    FINAL_FILE=/usr/local/bin/${1##*/}

    cp -f $1 $FINAL_FILE
    chmod +x $FINAL_FILE
}

function install_local_bin
{
    install_bin "$HOME/.dotfiles/bin/$1"
}

function install_prettyping
{
    curl -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping

    install_bin prettyping

    rm -f prettyping
}
