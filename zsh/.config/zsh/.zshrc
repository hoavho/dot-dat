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
# TODO - compinit is run every time I start new terminal -> check .zcompdump file timestamp -> can we improve it ?
compinit -d $ZDOTDIR/.zcompdump-$ZSH_VERSION
_comp_options+=(globdots)		# Include hidden files.
# ################################################
# END: Basic auto/tab complete:
# ################################################

# ================================================
# BEGIN: History config
# ================================================
# ---- General History config
HISTSIZE=10000000
SAVEHIST=10000000

# ---- History cache config
# Note: history cache dir has to be created first before history file can be written
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# man zshoptions
setopt SHARE_HISTORY         # share command history data

# Ensures that commands are added to the history immediately (otherwise, this would happen only when the shell exits, and you could lose history upon unexpected/unclean termination of the shell)
setopt inc_append_history

# Tip: you can `history` command to view the last n commands displays the timestamp information, in addition to the actual command
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_reduce_blanks     # remove unnecessary blanks
setopt hist_verify            # show command with history expansion to user before running it

# ================================================
# END: History in cache directory
# ================================================

# Useful Functions
source "$ZDOTDIR/functions.zsh"

# Enable features specific to your environment
GOOGLE_CLOUD_SDK_ENABLED=    # Set empty to disable, Set to 1 to enable Google Cloud SDK config
PYENV_ENABLED=1		     # Set to 1 to enable pyenv
PYENV_VIRTUAL_ENV_ENABLED=1  # Set to 1 to enable
SDKMAN_ENABLED=1	     # Set to 1 to enable

# ################################################
# Source/Load other config files and plugins
plug "$ZDOTDIR/exports.zsh"
plug "$ZDOTDIR/aliases.zsh"
plug "hoavho/ohmyzsh-git-prompt" # Load this before zsh-prompt
plug "hoavho/ohmyzsh-vi-mode"
plug "$ZDOTDIR/ohmyzsh-vi-mode-config.zsh"
plug "$ZDOTDIR/prompt.zsh"

ZSH_EVALCACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh-evalcache"
ZSH_EVALCACHE_DISABLE=false
plug "mroth/evalcache"

# lazy loading jenv - since "jenv init"  slows down prompt
plug "shihyuho/zsh-jenv-lazy"   # Run "jenv init" when jenv is called first time 
plug "zsh-users/zsh-autosuggestions"

# ================================================
# Load other configs (e.g. programs' specific configs)
plug "$ZDOTDIR/jenv-config.zsh"

# Homebrew
case `uname` in
  Darwin)
    # commands for OS X go here
    plug "$ZDOTDIR/homebrew-config.zsh"
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

plug "zap-zsh/fzf" # configure this after homebrew-config.zsh

# pyenv
plug "$ZDOTDIR/pyenv-config.zsh"
plug "$ZDOTDIR/pyenv-virtualenv-config.zsh"  # configure this after pyenv-config.zsh

# IMPORTANT: fast-syntax-highlighting SHOULD be sourced at the end
plug "zdharma-continuum/fast-syntax-highlighting"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
plug "$ZDOTDIR/sdkman-config.zsh"

