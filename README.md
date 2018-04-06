# dotfiles

My dotfiles.

## Prerequisites

For \*nix systems there are no prerequisites.

For Windows you must be running at least Windows 10 version 1709 (Fall Creators Update).

## Usage

To install, there are 2 methods.

### Single Use

This is for single uses. It will not keep track and allow you to commit changes to the dotfiles and
any changes will need to run the command again.

#### \*nix Systems

Run the following from a terminal:

```bash
bash -c "`curl -fsSL https://raw.github.com/RyanTheAllmighty/dotfiles/master/remote-install.sh`"
```

#### Windows Systems

TBA

### Long Term Use

This is when you want to continually add and update the dotfiles to a remote repository.

This connects this repository to your local `$HOME/.dotfiles` directory so you can use git to update
changes to your dotfiles.

In order for this to work, you'll need to make sure you setup your github ssh credentials.

#### \*nix Systems

Run the following from a terminal:

```bash
bash -c "`curl -fsSL https://raw.github.com/RyanTheAllmighty/dotfiles/master/remote-git-install.sh`"
```

#### Windows Systems

TBA

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
`includes/dotfiles.sh` file.

## Bin Files

The folders within `bin/` are added to the PATH and are made available from the command line.

## Tested Configurations

I've tested this using my own personal rigs which are made up of:

* Windows 10 Professional
* Manjaro Linux Gnome Edition

## Inspiration

Parts of this repository are inspired from the following repositories:

* <https://github.com/donnemartin/dev-setup>
