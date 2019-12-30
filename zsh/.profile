# set PATH so it includes user's private bin directories
PATH="$HOME/.local/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR=nvim
export BROWSER=chromium
export NODE_OPTIONS=--max-old-space-size=4096
export RANGER_LOAD_DEFAULT_RC=FALSE

# gpg agent stuff
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
    export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

# pyenv stuff
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
