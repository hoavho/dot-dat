# Set directories structure following XDG spec
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Default programs
export VISUAL=vim
export EDITOR=vim
export TERMINAL=st

# #######################################################
# Programs' specific exports
# #######################################################

# daedalus-mainnet
export PATH="$PATH:$HOME/.local/bin"

# cardano-node testnet
export CARDANO_NODE_SOCKET_PATH=/home/hoa/cardano-testnet/node.socket

# gcloud sdk
if [ -n "${GOOGLE_CLOUD_SDK_ENABLED:+1}" ]; then
  echo "google-cloud-sdk is enabled"
  source /etc/profile.d/google-cloud-sdk.sh 
  source /opt/google-cloud-sdk/completion.zsh.inc
fi

# GHCup - For haskell Dev
[ -f "/home/hoa/.ghcup/env" ] && source "/home/hoa/.ghcup/env" # ghcup-env

# Ruby
export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin

# Hadoop
export HADOOP_HOME=/opt/hadoop-3.3.4
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

# Spark
export SPARK_HOME=/opt/spark-3.3.2-bin-hadoop3
export PATH=$SPARK_HOME/bin:$PATH

# Python
case `uname` in
  Darwin)
    # commands for OS X go here
    export PATH=/usr/local/opt/python/libexec/bin:$PATH
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
