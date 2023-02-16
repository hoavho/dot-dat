#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias
alias n3='nnn -deU'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# set VISUAL + EDITOR
export VISUAL=vim
export EDITOR=vim

export TERMINAL=st

# settings for 'nnn' program
export NNN_COLORS='#0a1b2ce2;1234'
# FCOLORS following nord-dircolors theme - https://github.com/jarun/nnn/wiki/Themes
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# google-cloud-sdk
source /opt/google-cloud-sdk/completion.bash.inc
source /opt/google-cloud-sdk/path.bash.inc

# rust-lang - source .cargo env to update PATH
. "$HOME/.cargo/env"

# Hadoop
export HADOOP_HOME=/home/hoaho/.local/apps/hadoop-3.3.4
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# Spark
export SPARK_HOME=/home/hoaho/.local/apps/spark-3.3.1-bin-hadoop3
export PATH=$SPARK_HOME/bin:$PATH


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
