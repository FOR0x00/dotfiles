# for arm64 macos
if [ -f /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# Local
[[ -s ~/.zprofile.local ]] && source ~/.zprofile.local
