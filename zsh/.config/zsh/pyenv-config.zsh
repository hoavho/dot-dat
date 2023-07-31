if [ -n "${PYENV_ENABLED:+1}" ]; then
  HISTFILE=
  export PYENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  export PATH="$PYENV_ROOT/shims:${PATH}"
  eval "$(pyenv init -)"
fi

