export ZSH=~/.oh-my-zsh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

ZSH_THEME="agnoster"

plugins=(bgnotify)

source $ZSH/oh-my-zsh.sh

# Extend Autocomplete Search Path
fpath=($HOME/.zsh/lib/completions $fpath)

# Load and run compinit
autoload -U compinit
compinit -i

PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

# Go Path related exports
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Hide user@host from prompt
DEFAULT_USER=$USER
prompt_context(){}

# Make Ctrl-d close the shell
unsetopt ignoreeof

# Fix space being removed after tab completion
ZLE_SPACE_SUFFIX_CHARS=$'|&'

# Keep background processes running when closing terminal
setopt NO_HUP
setopt NO_CHECK_JOBS

# Disable Software Flow Control which causes terminal to hang on C-s (at least in vim)
stty -ixon
