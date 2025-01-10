function {
  0=${(%):-%x}
  local staticfile=${0:A}
  [[ -e ${staticfile} ]] || return 1
  if [[ ! -s ${staticfile}.zwc || ${staticfile} -nt ${staticfile}.zwc ]]; then
    builtin autoload -Uz zrecompile
    zrecompile -pq ${staticfile}
  fi
}
if is-theme-starship; then
  fpath+=( $ZSH_CUSTOM/plugins/starship-ftl )
  source $ZSH_CUSTOM/plugins/starship-ftl/starship-ftl.plugin.zsh
fi
fpath+=( $ZSH_CUSTOM/plugins/fzf )
source $ZSH_CUSTOM/plugins/fzf/fzf.plugin.zsh
fpath+=( $HOME/.cache/repos/mattmc3/ez-compinit )
source $HOME/.cache/repos/mattmc3/ez-compinit/ez-compinit.plugin.zsh
fpath+=( $HOME/.cache/repos/zsh-users/zsh-completions/src )
fpath+=( $HOME/.cache/repos/mattmc3/zephyr/plugins/color )
source $HOME/.cache/repos/mattmc3/zephyr/plugins/color/color.plugin.zsh
fpath+=( $HOME/.cache/repos/jeffreytse/zsh-vi-mode )
source $HOME/.cache/repos/jeffreytse/zsh-vi-mode/zsh-vi-mode.plugin.zsh
fpath+=( $HOME/.cache/repos/mattmc3/zephyr/plugins/zfunctions )
source $HOME/.cache/repos/mattmc3/zephyr/plugins/zfunctions/zfunctions.plugin.zsh
fpath+=( $HOME/.cache/repos/zsh-users/zsh-syntax-highlighting )
source $HOME/.cache/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
post-zsh-syntax-highlighting
fpath+=( $HOME/.cache/repos/zsh-users/zsh-autosuggestions )
source $HOME/.cache/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
post-autosuggestions
fpath+=( $HOME/.cache/repos/marlonrichert/zsh-autocomplete )
source $HOME/.cache/repos/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh
