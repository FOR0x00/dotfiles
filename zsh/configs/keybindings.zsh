## vi mode
KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

function wrap_clipboard_widgets() {
  local widget
  local wrapped_name
  for widget in "$@"; do
    wrapped_name="_zsh-vi-${widget}"
    eval "
      function ${wrapped_name}() {
        zle .${widget}
        printf %s \"\${CUTBUFFER}\" | pbcopy
      }
    "
    zle -N "${widget}" "${wrapped_name}"
  done
}

wrap_clipboard_widgets vi-yank vi-yank-eol vi-yank-whole-line

# https://github.com/LukeSmithxyz/voidrice/blob/master/.config/zsh/.zshrc#L40-L51
# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line
# bindkey -M vicmd '^e' edit-command-line

function lazygit_widget() {
  zle -I
  command lazygit
  zle reset-prompt
}
zle -N lazygit_widget
bindkey '^g' lazygit_widget

