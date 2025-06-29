# To profile zsh runtime startup, uncomment this line and the line at the bottom of the file
# zmodload zsh/zprof

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME=""

# _ and - are interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files # under VCS as dirty. Faster for large repos
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Do not auto update
zstyle ':omz:update' mode disabled

# Load plugins.
# Plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fasd)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin:$HOME/.local/bin:.:$PATH"
source $ZSH/oh-my-zsh.sh

# Use pure prompt https://github.com/sindresorhus/pure
# Config lines below come after oh-my-zsh
#
# One-time install:
#
#   mkdir -p "$HOME/.zsh" && git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
#
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

export LS_COLORS="di=34:ln=35"

# needs the file scrips/jump_lib_include on the path
function jli() {
  cd $(jump_lib_include)
}

alias vim='nvim'
alias ls='eza'
alias gti='git'
alias latexmk='latexmk -pvc -pdf -xelatex -shell-escape -interaction=nonstopmode'
# git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gr='cd $(git rev-parse --show-toplevel)'

eval "$(fasd --init auto)"
alias j='fasd_cd -d'
alias v='f -e nvim' # quick opening files with vim

if [ -f "$HOME/.zshrc.local" ]; then
   source "$HOME/.zshrc.local"
fi

if ! command -v nvim &> /dev/null; then
  export EDITOR="vim"
else
  export EDITOR="nvim"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# to print ZSH's startup profiling info, uncomment this line and the line at the top
# zprof
