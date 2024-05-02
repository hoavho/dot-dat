if [ -n "${NVM_ENABLED:+1}" ]; then
  export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
  case `uname -p` in
    i386)
      # commands for Mac intel chip
      [ -s "/usr/local/opt/nvm/nvm.sh" ] && source /usr/local/opt/nvm/nvm.sh # This load nvm
      [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source /usr/local/opt/nvm/etc/bash_completion.d/nvm # This load nvm bash_completion -> works fine with zsh
    ;;
    arm)
      # commands for Mac Apple silicon chip
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source /opt/homebrew/opt/nvm/nvm.sh # This load nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm # This load nvm bash_completion -> works fine with zsh
    ;;
  esac
fi
