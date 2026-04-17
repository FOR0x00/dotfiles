## vi mode
KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

# Clipboard
wrap_clipboard_widgets() {
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

# Change cursor shape for different vi modes.
_cursor_block() { printf '\e[1 q'; }
_cursor_beam()  { printf '\e[5 q'; }

zle-keymap-select () {
  case $KEYMAP in
    vicmd) _cursor_block ;;
    *) _cursor_beam ;;
  esac
}
zle-line-init() {
  case $KEYMAP in
    vicmd) _cursor_block ;;
    *) _cursor_beam ;;
  esac
}
zle-line-finish() {
  _cursor_block
}
zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish
# hooks
autoload -Uz add-zsh-hook
_cursor_preexec() { _cursor_beam; }
_cursor_precmd()  { _cursor_beam; }
add-zsh-hook preexec _cursor_preexec
add-zsh-hook precmd _cursor_precmd

# Widget
autoload edit-command-line; zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey -M vicmd '^E' edit-command-line

lazygit_widget() {
  zle -I
  command lazygit
  zle reset-prompt
}
zle -N lazygit_widget
bindkey '^G' lazygit_widget

