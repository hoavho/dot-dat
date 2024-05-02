# If you already installed sdkman (to default location at ~/.sdkman)
# -> you need to move it to $HOME/.local/share/sdkman 
# -> so run "mv ~/.sdkman ~/.local/share/sdkman"
if [ -n "${SDKMAN_ENABLED:+1}" ]; then
  export SDKMAN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sdkman"
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
fi
