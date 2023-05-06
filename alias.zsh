# Shortcuts
alias br="broot"
alias c="clear"
alias colorstrip="gsed -i -r 's/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g'"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias difff="git diff --"
alias eip="curl ifconfig.me"
alias hh="hstr"
alias ip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias mkd="mkdir -p "$@" && cd "$_";" # make dir and cd into it
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias reloadshell="source $HOME/.zshrc"
alias sca="screencapture -c -W -P" # capture screenshot
alias tf="terraform"
alias tft="TF_LOG=TRACE terraform"
alias tbt="/Users/gerard/dev/tfe/bundleparty/bin/tbt"
alias mock="tfe-sentinel-mock-generator"
alias mk="minikube"
alias k="kubectl"
alias crr="consul-raft-reader"
alias xcp="fc -ln -1 | pbcopy" # copy previous command
alias consuldev="/Users/gerard/dev/consul/consul/bin/consul"

# Directories
alias dotfiles="cd $DOTFILES"

# mkdir and cd
mkcdir() {
  mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# search for file name
ff() {
  find . -name "*$1*"
}

# curl cht.sh/
cht() {
  curl cht.sh/$1
}

# remove lines contain specific string
remove_lines() {
  gsed -i "/$1/d" $2
}

# copy from pet
pets() {
  pet search | pbcopy
}

# ssh into Consul server Docker container
cssh() {
  docker exec -it $1 /bin/sh
}

# docker compose
dc() {
  docker compose $1
}

# multipass
mp() {
  multipass "$@"
}
