if [ -n "${PYENV_VIRTUAL_ENV_ENABLED:+1}" ]; then
  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
fi
