if [ -n "${PYENV_VIRTUAL_ENV_ENABLED:+1}" ]; then
  # enable auto-activation of virtualenvs
  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
fi
