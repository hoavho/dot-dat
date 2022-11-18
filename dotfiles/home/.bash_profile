#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# auto run startx
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi
