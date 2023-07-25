# To enable zprof module -> to enable "zsh profiling" capability
zmodload zsh/zprof

# TIP: to diagnose shell startup slowness
# - Run timesh command to measure startup time
# - and run zprof to help identify the culprits

# Colors
autoload -Uz colors && colors

# ################################################
# BEGIN: Basic auto/tab complete:
# ################################################
zstyle ':completion:*' menu select
#zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:options' list-colors '=^(-- *)=96'
#zstyle ':completion:*' list-colors '=*=90'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zmodload zsh/complist
# Load and initialise completion system
autoload -U compinit
compinit
_comp_options+=(globdots)		# Include hidden files.
# ################################################
# END: Basic auto/tab complete:
# ################################################

# ================================================
# BEGIN: History in cache directory
# ================================================
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
# man zshoptions
setopt SHARE_HISTORY
# ================================================
# END: History in cache directory
# ================================================

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# ################################################
# Source/Load other config files and plugins
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
#zsh_add_file "zsh-vsc-info" # Load this before zsh-prompt
plug "hoavho/ohmyzsh-git-prompt" # Load this before zsh-prompt
plug "hoavho/ohmyzsh-vi-mode"
plug "$ZDOTDIR/ohmyzsh-vi-mode-config.zsh"
zsh_add_file "zsh-prompt"
#zsh_add_file "zsh-vim-mode"

ZSH_EVALCACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-evalcache"
ZSH_EVALCACHE_DISABLE=false
zsh_add_plugin "mroth/evalcache"

plug "shihyuho/zsh-jenv-lazy"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/fzf"

# ================================================
# Load other configs (e.g. programs' specific configs)
zsh_add_file "jenv-config"

# IMPORTANT: zsh-syntax-highlighting MUST be sourced at the end
# WHY? See https://github.com/zsh-users/zsh-syntax-highlighting
# WARNING: with zsh-jenv-lazy -> This will NOT be activated
# -> use fast-syntax-highlighting INSTEAD
# Notes:
# - If you have jenv installed -> eval $("jenv init") MUST be called for zsh-syntax-highlighting working.
#zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

# IMPORTANT: fast-syntax-highlighting SHOULD be sourced at the end
plug "zdharma-continuum/fast-syntax-highlighting"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

