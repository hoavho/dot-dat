# load .zshrc if exists
[[ -f ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc ]] && . ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zshrc

# Keep this line at bottom to "startx"
#if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
#	exec startx
#fi
