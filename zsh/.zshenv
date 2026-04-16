(( ${+XDG_CACHE_HOME}  )) || export XDG_CACHE_HOME="$HOME/.cache"
(( ${+XDG_CONFIG_HOME} )) || export XDG_CONFIG_HOME="$HOME/.config"
(( ${+XDG_DATA_HOME}   )) || export XDG_DATA_HOME="$HOME/.local/share"
(( ${+XDG_STATE_HOME}  )) || export XDG_STATE_HOME="$HOME/.local/state"

ZDOTDIR=$XDG_CONFIG_HOME/zsh

# XDG local bin
export PATH="$HOME/.local/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"

