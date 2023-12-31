# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Oh-my-zsh config
ZSH_THEME="simple"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Enable completions
autoload -Uz compinit && compinit

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z kubectl zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User config
export HISTFILE=~/.zsh_history
export HISTFILESIZE=10000
export HISTSIZE=10000

setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# HSTR
export HSTR_CONFIG=hicolor,no-confirm,blacklist # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"           # bind hstr to Ctrl-r (for Vi mode check doc)

autoload -U +X bashcompinit && bashcompinit

# Use current directory for Tab title
DISABLE_AUTO_TITLE="true"
