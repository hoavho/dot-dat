case `uname -p` in
  i386)
    # commands for Mac intel chip
    eval "$(/usr/local/bin/brew shellenv)"
  ;;
  arm)
    # commands for Mac Apple silicon chip
    eval "$(/opt/homebrew/bin/brew shellenv)"
  ;;
esac

if [ -n "${DIRENV_ENABLED:+1}" ]; then
    eval "$(direnv hook zsh)"
fi

