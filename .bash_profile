# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/nbin" ] ; then
  PATH="${HOME}/nbin:${PATH}"
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

