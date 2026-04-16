# Load zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz compinit
compinit -C
# Include dot
_comp_options+=(globdots)

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

# fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# use fzf-history-widget
# function zvm_after_init() {
#   zvm_bindkey viins "^R" fzf-history-widget
# }
# zinit light jeffreytse/zsh-vi-mode

# Disable completion ignore case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# fzf-tab
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# set descriptions format to enable group support
# zstyle ':completion:*:descriptions' format '[%d]'
# zstyle ':fzf-tab:*' switch-group '[' ']'

# zsh-autosuggestions
# bindkey '^f' autosuggest-accept
