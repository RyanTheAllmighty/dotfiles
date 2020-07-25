function upgrade_packages
{
    sudo yum update -y
    sudo yum upgrade -y
}

function install_package
{
    sudo yum update -y
    sudo yum install -y $@
}

function install_base_system_packages
{
    install_package unzip wget git git-lfs python vim tree p7zip python3-pip python3-devel iotop keychain
}

function install_pip_packages
{
    sudo pip3 install wakatime thefuck
}

function install_zsh
{
    install_package zsh autojump

    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    sudo mkdir -p /usr/local/share/antigen/
    sudo wget -O /usr/local/share/antigen/antigen.zsh https://git.io/antigen
}

function install_fnm
{
    curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
}
