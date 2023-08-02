if [ -n "${PYENV_ENABLED:+1}" ]; then
  export PYENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pyenv"
  command -v pyenv > /dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  command -v pyenv > /dev/null && eval "$(pyenv init -)"
fi

