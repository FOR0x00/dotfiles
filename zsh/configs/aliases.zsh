# Alias
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."

alias t="tmux new-session -A -s main"
alias ta="tmux a"
alias tl="tmux ls"

alias v="nvim"
alias vim="nvim"

alias o='open .'
alias q="exit"
alias c="clear"

alias jj="projj add"
alias py="python"
alias nvm="fnm"
alias lg="lazygit"

alias l="ls -la"
# eza
if (( $+commands[eza] )); then
  alias ls='eza --group-directories-first --icons=always'
  if eza --git /dev/null &>/dev/null; then
    alias ll='ls -l --git'      # Long format, git status
  else
    alias ll='ls -l'            # Long format
  fi
  alias l='ll -a'               # Long format, all files
  alias lr='ll -T'              # Long format, recursive as a tree
fi

# Make and cd
function mc() {
  if [ $# -ne 1 ]; then
    echo "usage: mc <dir-name>"
    return 137
  fi
  mkdir -p "$1" && cd "$1"
}

# tmp
function tmp() {
  local base="$HOME/Desktop/tmp"

  mkdir -p "$base"

  case "$1" in
    "")
      cd "$base" || return
      ;;
    -r)
      cd "$(mktemp -d "$base/${2:-tmp}.XXXX")" || return
      ;;
    -s)
      cd "$(find "$base" -maxdepth 1 -type d | fzf)" || return
      ;;
    *)
      if [[ "$1" != -* ]]; then
        mkdir -p "$base/$1" && cd "$base/$1"
      else
        echo "Usage:"
        echo "  tmp          # go to tmp dir"
        echo "  tmp name     # named dir"
        echo "  tmp -r       # random dir"
        echo "  tmp -s       # search via fzf"
      fi
      return
      ;;
  esac
}

# Goto root
function gr() {
    local git_root
    git_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [[ $? -eq 0 && -d $git_root ]]; then
        cd "$git_root"
    else
        echo "Not in a git repository or could not find the git root."
    fi
}

# Upgrade
function upgrade() {
  if (( $+commands[brew] )); then
    echo "==> Using Homebrew to upgrade..."
    brew update
    brew upgrade --greedy
    brew cleanup --prune=all
    #mas upgrade
  elif (( $+commands[pacman] )); then
    echo "==> Using pacman to upgrade..."
    sudo pacman -Syu
  else
    echo "No supported package manager found (brew or pacman)."
    return 1
  fi
}

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
