# dotfiles

My dotfiles.

## Prerequisites

There are no prerequisites, everything that's needed is installed by the scripts.

## Usage

Simply clone this repository to a directory called `.dotfiles` in your user home directory:

```sh
git clone git@github.com:RyanTheAllmighty/dotfiles.git $HOME/.dotfiles
```

Or if you don't have git installed, simply
[download](https://github.com/RyanTheAllmighty/dotfiles/archive/master.zip) and extract to your home
directory.

Then run the install file based on your operating system.

For \*nix systems run `sh install.sh`.

For Windows Systems right click the `install.ps1` file and run it as administrator.

## Editing Files

When you install this repository, it stores all the files in `$HOME/.dotfiles` directory.

The contents of this directory are not too important, it's used to install and configure the system
and install the dotfiles.

Inside the `files` directory are multiple folders for each OS as well as common `nix` one.

Files are then symlinked to your home directory (or appropriate place).

So whenever you want to edit a file, don't do it from within the `$HOME/.dotfiles` directory,
instead do it from where the file is located.

## Adding Files

To add new files you simply need to put it in the `files` directory and then add it into the correct
files in the `install_dotfiles` functions for \*nix and `Install_Dotfiles` for Windows.

## Bin Files

The folders within `bin/` are added to the PATH and are made available from the command line.

## Tested Configurations

I've tested this using my own personal rig which uses Windows 10 Professional. But is also used when
using WSL and Docker containers using VSCode remote.

This also works with various OSX configurations out of the box.

This was previously used for a Manjaro Linux system, but I've since moved away from using Linux for
my main machine, but it's left there in case one day I revisit it.

## Inspiration

Parts of this repository are inspired from the following repositories:

- <https://github.com/donnemartin/dev-setup>
