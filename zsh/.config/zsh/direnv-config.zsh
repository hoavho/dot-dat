if [ -n "${DIRENV_ENABLED:+1}" ]; then
  command -v direnv >/dev/null || eval "$(direnv hook zsh)"
fi
