# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

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

