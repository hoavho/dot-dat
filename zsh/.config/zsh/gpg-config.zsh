# https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html
#
if [ -n "${GPG_ENABLED:+1}" ]; then
  echo "here"
  export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
  if [ ! -d "$GNUPGHOME" ]; then
    echo "$GNUPGHOME not found. Creating it ..."
    mkdir -p $GNUPGHOME
    echo "$GNUPGHOME is created"
    chown -R $(whoami) $GNUPGHOME
    chmod 700 $GNUPGHOME
  fi
fi
