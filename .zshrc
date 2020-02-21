export PATH=~/bin:$PATH
alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" # ls colors like in Linux
# fpath=($(brew --prefix)/share/zsh-completions $fpath)
# zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh/functions $fpath)
autoload -Uz compinit && compinit -u

