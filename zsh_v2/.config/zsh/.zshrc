#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# Create ~/.hushlogin to suppress "Last login" message
touch ~/.hushlogin

# Print the MOTD every time you log in
if [ -f /etc/motd ]; then
    cat /etc/motd
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"



#
# Zstyles
#

# Load .zstyles file with customizations.
[[ -r ${ZDOTDIR:-$HOME}/.zstyles ]] && source ${ZDOTDIR:-$HOME}/.zstyles

#
# Theme
#

# Set prompt theme
typeset -ga ZSH_THEME
zstyle -a ':zephyr:plugin:prompt' theme ZSH_THEME ||
ZSH_THEME=(starship frwd)

# Set helpers for antidote.
is-theme-p10k()     { [[ "$ZSH_THEME" == (p10k|powerlevel10k)* ]] }
is-theme-starship() { [[ "$ZSH_THEME" == starship* ]] }

#
# includes
#

# Load things from includes/common including
# - antidote.zsh -> to configure Antidote plugins manager
# - history.zsh -> to configure Zsh history
# - aliases.zsh -> to configure "aliases"
for zlib in $ZDOTDIR/includes/common/*.zsh; source $zlib
unset zlib

#
# Prompt
#

# Call "prompt" command to set prompt theme
setopt prompt_subst transient_rprompt
autoload -Uz promptinit && promptinit
prompt "$ZSH_THEME[@]"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
