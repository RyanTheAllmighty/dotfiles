# path to oh-my-zsh installation
[[ -d /usr/share/oh-my-zsh ]] && export ZSH=/usr/share/oh-my-zsh
[[ -d $HOME/.oh-my-zsh ]] && export ZSH=$HOME/.oh-my-zsh

# add in antigen
[[ -f /usr/share/zsh/share/antigen.zsh ]] && source /usr/share/zsh/share/antigen.zsh
[[ -f /usr/local/share/antigen/antigen.zsh ]] && source /usr/local/share/antigen/antigen.zsh

# spaceship theme options
export SPACESHIP_PACKAGE_SHOW=false
export SPACESHIP_NODE_SHOW=false
export SPACESHIP_EXIT_CODE_SHOW=true

# awsp configuration
export AWSP_FILE_TO_READ='~/.aws/credentials';
export AWSP_USE_CREDENTIALS=true;

# enable oh-my-zsh
antigen use oh-my-zsh

# set the theme
antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

# zsh default plugins
antigen bundle git

# oh-my-zsh plugins
antigen bundle robbyrussell/oh-my-zsh plugins/autojump
antigen bundle robbyrussell/oh-my-zsh plugins/aws
antigen bundle robbyrussell/oh-my-zsh plugins/docker
antigen bundle robbyrussell/oh-my-zsh plugins/docker-compose
antigen bundle robbyrussell/oh-my-zsh plugins/gpg-agent
antigen bundle robbyrussell/oh-my-zsh plugins/kubectl
antigen bundle robbyrussell/oh-my-zsh plugins/npm
antigen bundle robbyrussell/oh-my-zsh plugins/perms
antigen bundle robbyrussell/oh-my-zsh plugins/thefuck
antigen bundle robbyrussell/oh-my-zsh plugins/terraform
antigen bundle robbyrussell/oh-my-zsh plugins/vagrant

# custom plugins
antigen bundle bobsoppe/zsh-ssh-agent
antigen bundle chrissicool/zsh-256color
antigen bundle lukechilds/zsh-better-npm-completion
antigen bundle michaelxmcbride/zsh-dircycle
antigen bundle peterhurford/git-it-on.zsh
antigen bundle rawkode/zsh-docker-run
antigen bundle sobolevn/wakatime-zsh-plugin
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zpm-zsh/colors
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle walesmd/caniuse.plugin.zsh
antigen bundle zpm-zsh/autoenv

# apply antigen bundles/theme
antigen apply

# fnm
eval "$(fnm env --multi)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# export environment variables
export LANG=en_AU.UTF-8
export EDITOR='code --wait'

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

if type "_awsp" > /dev/null; then
    alias awsp="source _awsp"
fi

if type "bat" > /dev/null; then
    alias cat="bat"
fi

if type "prettyping" > /dev/null; then
    alias ping="prettyping --nolegend"
fi

if type "tldr" > /dev/null; then
    alias tldr="tldr --theme ocean"
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
