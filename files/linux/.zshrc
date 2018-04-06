# path to oh-my-zsh installation
export ZSH=/home/ryan/.oh-my-zsh

# add in antigen
source /usr/share/zsh/share/antigen.zsh

# nvm configuration
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# enable oh-my-zsh
antigen use oh-my-zsh

# set the theme
antigen theme avit

# zsh default plugins
antigen bundle git

# oh-my-zsh plugins
antigen bundle robbyrussell/oh-my-zsh plugins/autojump
antigen bundle robbyrussell/oh-my-zsh plugins/aws
antigen bundle robbyrussell/oh-my-zsh plugins/docker
antigen bundle robbyrussell/oh-my-zsh plugins/docker-compose
antigen bundle robbyrussell/oh-my-zsh plugins/npm
antigen bundle robbyrussell/oh-my-zsh plugins/perms
antigen bundle robbyrussell/oh-my-zsh plugins/thefuck
antigen bundle robbyrussell/oh-my-zsh plugins/vagrant

# custom plugins
antigen bundle lukechilds/zsh-nvm
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle wbingli/zsh-wakatime
antigen bundle zsh-users/zsh-syntax-highlighting

# apply antigen bundles/theme
antigen apply

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

export EDITOR='vim'

# import aliases
. ~/.aliases