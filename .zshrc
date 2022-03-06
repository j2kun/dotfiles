# To profile zsh runtime startup, uncomment this line and the line at the bottom of the file
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"
DEFAULT_USER=$(whoami)

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Do not auto update
DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fasd)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/.local/bin:.:$PATH"
source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias ls='exa'
export LS_COLORS="di=34:ln=35"

alias gti='git'

eval "$(fasd --init auto)"
alias j='fasd_cd -d'
alias v='f -e vim' # quick opening files with vim

alias latexmk='latexmk -pvc -pdf -xelatex -interaction=nonstopmode'

# git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


if [ -f ".zshrc.local" ]; then
   source .zshrc.local
fi

# to print ZSH's startup profiling info, uncomment this line and the line at the top
# zprof
