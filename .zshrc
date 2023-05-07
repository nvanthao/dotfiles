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

# Functions
# create .tar.gz
targz() {
  tar -zcvf $1.tar.gz $1
  rm -r $1
}
# extra .tar.gz
untargz() {
  tar -zxvf $1
  rm -r $1
}

autoload -U +X bashcompinit && bashcompinit

# Env
# For ProxyMan
# export http_proxy=http://127.0.0.1:9090
# For GCP
# export GOOGLE_APPLICATION_CREDENTIALS=$HOME/gerard-gcp-credential.json

# gcloud
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Terraform
# export TERRAFORM_CONFIG=$HOME/.terraform.d/credentials.tfrc.json
# added by travis gem
# [ ! -s /Users/gerard/.travis/travis.sh ] || source /Users/gerard/.travis/travis.sh

# Pet CLI Snippet Manager
# Remember previous command
# https://github.com/knqyf263/pet#zsh-prev-function
function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new $(printf %q "$PREV")"
}

# Use current directory for Tab title
DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# Auto completion for Nomad
complete -o nospace -C /usr/local/bin/nomad nomad
