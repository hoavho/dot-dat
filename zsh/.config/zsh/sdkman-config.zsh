if [ -n "${SDKMAN_ENABLED:+1}" ]; then
  export SDKMAN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
