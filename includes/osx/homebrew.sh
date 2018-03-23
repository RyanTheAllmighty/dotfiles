function install_homebrew
{
    # Install command-line tools using Homebrew.

    # Check for Homebrew,
    # Install if we don't have it
    if test ! $(which brew); then
        echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # Make sure we’re using the latest Homebrew.
    brew update

    # Upgrade any already-installed formulae.
    brew upgrade --all

    # Remove outdated versions from the cellar.
    brew cleanup
}

function install_command_line_utilities
{
    # Install GNU core utilities (those that come with OS X are outdated).
    # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
    brew install coreutils
    sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

    # Install some other useful utilities like `sponge`.
    brew install moreutils

    # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
    brew install findutils

    # Install GNU `sed`, overwriting the built-in `sed`.
    brew install gnu-sed --with-default-names

    # Install `wget` with IRI support.
    brew install wget --with-iri

    # Install Python
    brew install python
    brew install python3

    # Install more recent versions of some OS X tools.
    brew install vim --override-system-vi
    brew install homebrew/dupes/grep
    brew install homebrew/dupes/openssh
    brew install homebrew/dupes/screen

    # Install font tools.
    brew tap bramstein/webfonttools
    brew install sfnt2woff
    brew install sfnt2woff-zopfli
    brew install woff2

    # Install other useful binaries.
    brew install git
    brew install git-lfs
    brew install git-flow
    brew install git-extras

    brew install imagemagick --with-webp
    brew install p7zip
    brew install rename
    brew install speedtest_cli
    brew install ssh-copy-id
    brew install tree
}

function install_applications
{
    # Install applications
    brew cask install --appdir="~/Applications" alfred
    brew cask install --appdir="~/Applications" visual-studio-code
    brew cask install --appdir="~/Applications" google-chrome
    brew cask install --appdir="~/Applications" firefox
    brew cask install --appdir="~/Applications" 1password
    brew cask install --appdir="~/Applications" docker
    brew cask install --appdir="~/Applications" hyper
    brew cask install --appdir="~/Applications" postman
    brew cask install --appdir="~/Applications" bartender
    brew cask install --appdir="~/Applications" beardedspice
    brew cask install --appdir="~/Applications" discord
    brew cask install --appdir="~/Applications" gitkraken
    brew cask install --appdir="~/Applications" istat-menus
    brew cask install --appdir="~/Applications" spotify
}

function install_extra_applications
{
    # Install extra applications
    brew cask install --appdir="~/Applications" hipchat
    brew cask install --appdir="~/Applications" virtualbox
    brew cask install --appdir="~/Applications" vagrant
    brew cask install --appdir="~/Applications" iterm2
}

function install_zsh
{
    brew install zsh
    brew install antigen
    add_shell "/usr/local/bin/zsh"
}
