# Android
if [[ -d "$HOME/Library/Android/sdk" ]]; then
  export ANDROID_HOME=$HOME/Library/Android/sdk
  export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
  export PATH=$ANDROID_HOME/platform-tools:$PATH
fi
# PNPM
if [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME=$HOME/.local/share/pnpm
  export PATH=$PNPM_HOME:$PATH
fi
[[ -d "$HOME/go/bin" ]] && export PATH=$HOME/go/bin:$PATH
[[ -d "$HOME/.cargo/bin" ]] && export PATH=$HOME/.cargo/bin:$PATH

# FZF
export FZF_DEFAULT_OPTS="--bind=ctrl-a:select-all,?:toggle-preview"
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
# export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_PREVIEW='([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -n 200'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'

