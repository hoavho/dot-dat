export ZSH_PLUGIN_DIR="$ZDOTDIR/plugins"
export -a ZSH_INSTALLED_PLUGINS=()
#fpath+="$ZAP_DIR/completion"

# This plug() function is copied from https://github.com/zap-zsh/zap/blob/master/zap.zsh
function plug() {

    function _try_source() {
        local -a initfiles=(
            $plugin_dir/${plugin_name}.{plugin.,}{z,}sh{-theme,}(N)
            $plugin_dir/*.{plugin.,}{z,}sh{-theme,}(N)
        )
	#echo $initfiles[1]
        (( $#initfiles )) && source $initfiles[1]
    }

    # If the absolute is a directory then source as a local plugin
    pushd -q "$ZDOTDIR"
    local plugin_absolute="${1:A}"
    #echo "plugin_aboslute = $plugin_absolute"
    popd -q
    if [ -d "${plugin_absolute}" ]; then
        local plugin="${plugin_absolute}"
        local plugin_name="${plugin:t}"
    	#echo "plugin_name = $plugin_name"
        local plugin_dir="${plugin_absolute}"
    else
        # If the basename directory exists, then local source only
        if [ -d "${plugin_absolute:h}" ]; then
            [[ -f "${plugin_absolute}" ]] && source "${plugin_absolute}"
            return
        fi

        local plugin="$1"
        local plugin_name="${plugin:t}"
    	#echo "plugin_name = $plugin_name"
        local plugin_dir="$ZSH_PLUGIN_DIR/$plugin_name"
    fi

    local git_ref="$2"
    if [ ! -d "$plugin_dir" ]; then
        echo "🔌 Zap is installing $plugin_name..."
        git clone --depth 1 "${ZAP_GIT_PREFIX:-"https://github.com/"}${plugin}.git" "$plugin_dir" > /dev/null 2>&1 || { echo -e "\e[1A\e[K❌ Failed to clone $plugin_name"; return 12 }
        echo -e "\e[1A\e[K⚡ Zap installed $plugin_name"
    fi
    [[ -n "$git_ref" ]] && {
        git -C "$plugin_dir" pull --unshallow > /dev/null 2>&1
        git -C "$plugin_dir" checkout "$git_ref" > /dev/null 2>&1 || { echo "❌ Failed to checkout $git_ref"; return 13 }
    }
    _try_source && { ZSH_INSTALLED_PLUGINS+="$plugin_name" && return 0 } || echo "❌ $plugin_name not activated" && return 1
}

# Measure shell startup time
function timesh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do time $shell -i -c exit; done
}
