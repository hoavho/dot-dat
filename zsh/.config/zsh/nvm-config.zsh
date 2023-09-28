if [ -n "${NVM_ENABLED:+1}" ]; then
  export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && source $(brew --prefix nvm)/nvm.sh # This load nvm
  [ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && source $(brew --prefix nvm)/etc/bash_completion.d/nvm # This load nvm bash_completion -> works fine with zsh
fi
