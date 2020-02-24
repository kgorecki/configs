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

