function add_directory_to_path()
{
  if [[ -d "$1" ]] && [[ :$PATH: != *:"$1":* ]]; then
    export PATH=$1:$PATH
  fi
}

add_directory_to_path ${HOME}/bin
add_directory_to_path ${HOME}/prog

alias ls='ls -G'
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" # ls colors like in Linux
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
zstyle ":completion:*:commands" rehash 1 # refresh apps in PATH

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# takan from here: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
zstyle ':vcs_info:git:*' formats '%{%F{yellow}%}%r%{%f%}: %{%F{green}%}%b%{%f%}'

