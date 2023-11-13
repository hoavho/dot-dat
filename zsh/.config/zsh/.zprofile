# load .zshrc if exists
case `uname` in
  Darwin)
    # commands for OS X go here
  ;;
  Linux)
    # commands for Linux go here
    [[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc ]] && . ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc

    if [ -n "${X_SYSTEM:+1}" ]; then
    	# Keep this line at bottom to "startx"
    	if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    		exec startx
    	fi
    fi
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

