# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

# ignore duplicate lines
HISTCONTROL=ignoreboth

# append to the history file
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

stty -ixon

if uname | grep CYGWIN > /dev/null; then
  function killall  {
    if [ $# -ne 1 ]; then
      echo "No process name provided!"
    else
      if echo ${1} | grep 'exe$' > /dev/null; then
        taskkill /F /IM ${1}
      else
        taskkill /F /IM ${1}.exe
      fi
    fi
  }
fi

alias ydl='youtube-dl --add-metadata -x --audio-format mp3'

# enable colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

. git-completion.bash

