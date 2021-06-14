# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
# System dirs
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

# Other variables
export EDITOR=nvim
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
#export RANGER_LOAD_DEFAULT_RC=FALSE
#export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Intel video acceleration for chromium
#export LIBVA_DRIVER_NAME="iHD"

# CUDA
#export LD_LIBRARY_PATH=/opt/cuda/lib
#export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# fzf
export FZF_DEFAULT_OPTS='--color=16'

# GPG agent
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

# Android Studio / adb
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator

# Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

# Node
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Python
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Nord man pages
export LESS_TERMCAP_mb=$'\E[1;34m'
export LESS_TERMCAP_md=$'\E[1;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;40;35m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[1;32m'
export LESS_TERMCAP_ue=$'\E[0m'

# Go
# export GOPATH="$XDG_DATA_HOME"/go
