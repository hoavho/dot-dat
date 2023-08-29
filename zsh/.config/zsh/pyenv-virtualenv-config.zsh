if [ -n "${PYENV_VIRTUAL_ENV_ENABLED:+1}" ]; then
  # Try to find pyenv, if it's not on the path
  export PYENV_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/pyenv"
  if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
  fi

  # Lazy load pyenv
  if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
  fi
fi
