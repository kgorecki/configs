function add_directory_to_path()
{
  if [[ -d "$1" ]] && [[ :$PATH: != *:"$1":* ]]; then
    export PATH=$1:$PATH
  fi
}

# PATH:
add_directory_to_path ${HOME}/bin
add_directory_to_path ${HOME}/prog

# aliases:
alias ls='ls -G'

# colours:
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" # ls colors like in Linux

# git completion:
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit
zstyle ":completion:*:commands" rehash 1 # refresh apps in PATH

# prompt:
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt prompt_subst
if [[ `uname` == "Darwin" ]]; then
  RPROMPT="\$vcs_info_msg_0_ | "`pmset -g batt | grep -Eo "\d+%" | cut -d% -f1`"%%"
else
  RPROMPT="\$vcs_info_msg_0_ " '$(acpi | grep -o "[0-9]*%)%'
fi
# takan from here: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
zstyle ':vcs_info:git:*' formats '%{%F{yellow}%}%r%{%f%}: %{%F{green}%}%b%{%f%}'

