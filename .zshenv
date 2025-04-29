[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

[ -f "/home/byut/.ghcup/env" ] && source "/home/byut/.ghcup/env" # ghcup-env
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -x "go" ] && export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# --- #

export _JAVA_AWT_WM_NONREPARENTING=1
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"

# Enable Wayland for Tor Browser
export MOZ_ENABLE_WAYLAND=1

# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
