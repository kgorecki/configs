export PATH=~/bin:$PATH
alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" # ls colors like in Linux
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

