setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt EXTENDED_GLOB

# History
HISTSIZE=20000
SAVEHIST=10000
HISTFILE=$ZDOTDIR/.zsh_history

# Add more data
setopt EXTENDED_HISTORY
# Immediately append to the history file
setopt INC_APPEND_HISTORY
# Share history across terminals
setopt SHARE_HISTORY
# Ingore when the first character on the line is a space
setopt HIST_IGNORE_SPACE
# When searching, do not display duplicated entries
setopt HIST_FIND_NO_DUPS
# Expire duplicate entries first
setopt HIST_EXPIRE_DUPS_FIRST
# Remove older duplicates
setopt HIST_IGNORE_ALL_DUPS
# Remove extra blanks
setopt HIST_REDUCE_BLANKS
# Don't execute immediately upon history expansion
setopt HIST_VERIFY

source $ZDOTDIR/configs/env.zsh
source $ZDOTDIR/configs/aliases.zsh
source $ZDOTDIR/configs/plugins.zsh
source $ZDOTDIR/configs/keybindings.zsh

if (( $+commands[fzf] )); then
  # Set up fzf key bindings and fuzzy completion
  source <(fzf --zsh)
fi

if (( $+commands[zoxide] )); then
  eval "$(zoxide init --cmd cd zsh)"
fi

if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi

# SDKMAN
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# Local
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

