# path to oh-my-zsh installation
[[ -d /usr/share/oh-my-zsh ]] && export ZSH=/usr/share/oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] && export ZSH=$HOME/.oh-my-zsh

# add in antigen
[[ -f /usr/share/zsh/share/antigen.zsh ]] && source /usr/share/zsh/share/antigen.zsh
[[ -f /usr/local/share/antigen/antigen.zsh ]] && source /usr/local/share/antigen/antigen.zsh

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
antigen bundle sobolevn/zsh-wakatime
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle bobsoppe/zsh-ssh-agent

# apply antigen bundles/theme
antigen apply

# export environment variables
export LANG=en_AU.UTF-8
export EDITOR='vim'

# import seperate environment file if it exists
if [ -f ~/.environment ]; then
    . ~/.environment
fi

# uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh

if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir -p $ZSH_CACHE_DIR
fi

# import seperate aliases file if it exists
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi
