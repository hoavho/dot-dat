# Starship faster-than-light

zstyle ':zephyr:plugin:prompt' skip yes    # Skip zephyr prompt plugin if it's loaded

# Load plugin functions.
0=${(%):-%N}
fpath=(${0:A:h}/functions $fpath)
autoload -Uz ${0:A:h}/functions/*(.:t)

