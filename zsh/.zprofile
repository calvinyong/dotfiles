# Add .local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Wayland
#export ELECTRON_OZONE_PLATFORM_HINT="auto"

# Other variables
export EDITOR=nvim

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
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history

# Python
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export RUFF_CACHE_DIR="$XDG_CACHE_HOME"/ruff

# Sqlite
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history

# pyenv
# export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

# Misc clean home
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel

# Less
export LESSSECURE=1

# Eza
export EZA_STRICT=1

# Java
#export _JAVA_AWT_WM_NONREPARENTING=1

# https://wiki.archlinux.org/title/Color_output_in_console#Using_less
# export MANPAGER="less -R -Dd+c -Du+g -Ds+m"
# export MANROFFOPT="-P -c"

# Colored man pages with ANSI escape codes. See man termcap
# Tell grotty to use the legacy format. See man grotty
export GROFF_NO_SGR=1
# Set bold text to bold blue
export LESS_TERMCAP_md=$'\e[34;1m'
export LESS_TERMCAP_me=$'\e[0m'
# Set underlined text to underline green
export LESS_TERMCAP_us=$'\e[32;4m'
export LESS_TERMCAP_ue=$'\e[0m'
# Set standout (bottom text box) to purple fg, black bg, and bold
export LESS_TERMCAP_so=$'\e[35;40;1m'
export LESS_TERMCAP_se=$'\e[0m'
