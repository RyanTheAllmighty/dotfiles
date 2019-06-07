function upgrade_packages
{
    sudo apt update -y
    sudo apt upgrade -y
}

function install_apt_package
{
    sudo apt install -y $@
}

function install_base_system_packages
{
    install_apt_package git git-lfs python vim tree speedtest-cli p7zip iotop
}

function install_zsh
{
    install_apt_package zsh autojump thefuck

    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    sudo mkdir -p /usr/local/share/antigen/
    sudo wget -O /usr/local/share/antigen/antigen.zsh https://git.io/antigen
}
