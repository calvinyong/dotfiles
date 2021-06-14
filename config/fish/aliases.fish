#####################################
#    / \  | (_) __ _ ___  ___  ___  #
#   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / ___ \| | | (_| \__ \  __/\__ \ #
# /_/   \_\_|_|\__,_|___/\___||___/ #
#####################################

# ls aliases
alias ls='ls -vN --color=auto --group-directories-first'
alias la='ls -A'
alias l='exa --group-directories-first -l'
alias ll='l -a'
# If don't have exa
# alias ll='ls -AlhF'
# alias l='ls -lh'

# color aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Cute aliases
alias plz='sudo'
alias please='sudo'

# Program aliases
alias vim='nvim'
alias more='less'
alias df='df -h'
alias cat='bat --theme base16'
alias ytdl-audio="youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/audio.conf"
alias ytdl-video="youtube-dl --config-location $XDG_CONFIG_HOME/youtube-dl/video.conf"

# XDG Compliance
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Other aliases
alias clock='tty-clock -cbts'
alias ssh-termux='adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022'
alias weather='curl wttr.in'
alias pacsearch='pacman -Slq | fzf -m --preview "pacman -Si {1}"'
