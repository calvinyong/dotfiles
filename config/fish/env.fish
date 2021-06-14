# Add .local/bin to PATH
fish_add_path $HOME/.local/bin

# XDG Base Directory Specification
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
# System dirs
set -x XDG_DATA_DIRS "/usr/local/share:/usr/share"
set -x XDG_CONFIG_DIRS "/etc/xdg"

# Other variables
set -x EDITOR nvim
set -x BROWSER chromium
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
#set -x RANGER_LOAD_DEFAULT_RC FALSE
#set -x QT_AUTO_SCREEN_SCALE_FACTOR 0

# Intel video acceleration for chromium
set -x LIBVA_DRIVER_NAME "iHD"

# CUDA
set -x LD_LIBRARY_PATH /opt/cuda/lib
set -x CUDA_CACHE_PATH "$XDG_CACHE_HOME"/nv

# fzf
set -x FZF_DEFAULT_OPTS '--color 16'

# GPG agent
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)

# Android Studio / adb
set -x ANDROID_PREFS_ROOT "$XDG_CONFIG_HOME"/android
set -x ANDROID_EMULATOR_HOME "$XDG_DATA_HOME"/android/emulator

# Rust
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x RUSTUP_HOME "$XDG_DATA_HOME"/rustup
fish_add_path $XDG_DATA_HOME/cargo/bin

# Node
set -x NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history

# Python
set -x IPYTHONDIR "$XDG_CONFIG_HOME"/jupyter
set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter

# pyenv
set -x PYENV_ROOT "$XDG_DATA_HOME/pyenv"
#fish_add_path $PYENV_ROOT/bin
status is-login; and pyenv init --path | source
#pyenv init - | source

# Nord man pages
set -x LESS_TERMCAP_mb (printf '\e[1;34m')
set -x LESS_TERMCAP_md (printf '\e[1;34m')
set -x LESS_TERMCAP_me (printf '\e[0m')
set -x LESS_TERMCAP_so (printf '\e[01;40;35m')
set -x LESS_TERMCAP_se (printf '\e[0m')
set -x LESS_TERMCAP_us (printf '\e[1;32m')
set -x LESS_TERMCAP_ue (printf '\e[0m')
