function upgrade_packages
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

function install_apt_package
{
    sudo apt-get update -y
    sudo apt-get install -y $@
}

function install_base_system_packages
{
    install_apt_package unzip wget git git-lfs python vim tree speedtest-cli p7zip python3-pip iotop
}

function install_pip_packages
{
    sudo pip install wakatime
}

function install_zsh
{
    install_apt_package zsh autojump thefuck

    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    sudo mkdir -p /usr/local/share/antigen/
    sudo wget -O /usr/local/share/antigen/antigen.zsh https://git.io/antigen
}

function install_fnm
{
    curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
}
