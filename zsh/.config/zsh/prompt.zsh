# Enable colors
autoload -U colors && colors	# Load colors

# Enable Substitution in the PROMPT
# e.g. using the format ${variable_name}
setopt prompt_subst

# Per zshmisc man page (under QUOTING section)
#  A string enclosed between ‘$'' and ‘'' is processed the same way as
#  the string arguments of the print builtin, and the resulting string is
#  considered to be entirely quoted
NEWLINE=$'\n'

# man zshparam -> to see PS1 vs PROMPT
# man zshmisc -> to see SIMPLE PROMPT ESCAPE
# 	Special characters
# 	Login info
# 	Shell state
#	  %# = display A ‘#' if the shell is running with privileges, a ‘%' if not
# 	Visual effects e.g.
# 	  %B (%b) = Start (stop) boldface mode.
#
# man zshexpn -> ${name} = syntax to substitute value of variable "name"
#   {..} curly braces are optional - only required if expansion is followed by a letter, digit, or underscore that is not be interpreted as part of name.

#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
#PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b$NEWLINE%# "


# zsh PROMPT explanation (See "man zshmisc -> section "SIMPLE PROMPT ESCAPES")
# %n = $USERNAME
# %M = full machine hostname
# %~ =  As %d and %/, but if the current working directory starts with $HOME, that part is replaced by a ‘~'
# %1d = Display current working directory only -> See %d for details

# [username@hostname fullpath]
PROMPT_FORMAT1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}%b"
# [frw.d@journey current_dir]
PROMPT_FORMAT2="%B%{$fg[red]%}[%{$fg[yellow]%}frw.d%{$fg[green]%}@%{$fg[blue]%}journey %{$fg[magenta]%}%1d%{$fg[red]%}]%{$reset_color%}%b"

if [[ "$PROMPT_FORMAT" == 1 ]]; 
then
	PROMPT=$PROMPT_FORMAT1
elif [[ "$PROMPT_FORMAT" == 2 ]]; 
then
	PROMPT=$PROMPT_FORMAT2
else # default
	PROMPT=$PROMPT_FORMAT1
fi

#PROMPT="%B%{$fg[yellow]%}⚡% %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%}"
#PROMPT+="\$vcs_info_msg_0_ "
PROMPT+='$(git_super_status)'
PROMPT+="$NEWLINE%# "
RPROMPT='' # Reset to empty - RPROMPT is set by ohmyzsh-git-prompt
RPS1='$(vi_mode_prompt_info)' # Display vi mode as RPROMPT
