function update_packages
{
    sudo apt update
}

function upgrade_packages
{
    update_packages
    sudo apt -y upgrade
}

# installs a package (if not already installed) and will answer yes to all questions
function install_package
{
    sudo apt -y install $@
}

# remove a package
function remove_package
{
    sudo apt -y remove $@
}

function install_base_system_packages
{
    install_package git git-lfs python vim tree speedtest-cli p7zip build-essential iotop curl
}

function install_zsh
{
    install_package zsh autojump thefuck

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    install_package zsh-antigen
}

function install_yarn
{
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    update_packages
    install_package --no-install-recommends yarn
}

# install development tools needed
function install_development_tools
{
    mkdir -p "$HOME/.nvm"
    install_package aws-cli

    install_yarn
}
