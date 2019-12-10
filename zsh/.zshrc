##############################
#            _               #
#    _______| |__  _ __ ___  #
#   |_  / __| '_ \| '__/ __| #
#  _ / /\__ \ | | | | | (__  #
# (_)___|___/_| |_|_|  \___| #
#                            #
##############################

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
ZSH_THEME="calvin-theme"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git fast-syntax-highlighting colored-man-pages fzf)

source $ZSH/oh-my-zsh.sh


#####################################
#    / \  | (_) __ _ ___  ___  ___  #
#   / _ \ | | |/ _` / __|/ _ \/ __| #
#  / ___ \| | | (_| \__ \  __/\__ \ #
# /_/   \_\_|_|\__,_|___/\___||___/ #
#####################################

# Remove aliases (aliases coming from plugins)
unalias -m '*'

# ls aliases
alias ls='ls -vN --color=auto --group-directories-first'
alias ll='ls -AlhF'
alias la='ls -A'
alias l='ls -lh'

# color aliases
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# Cute aliases
alias plz='sudo'
alias please='sudo'

# Program aliases
alias vim='nvim'
alias clock='tty-clock -cbts'
alias ticker='ticker AAPL MSFT GOOG BTC-USD'
alias more='less'
alias cat='bat'

# Other aliases
alias ssh-termux='adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022'
alias weather='curl wttr.in'

###################################
#   ___  _   _                    #
#  / _ \| |_| |__   ___ _ __ ___  #
# | | | | __| '_ \ / _ \ '__/ __| #
# | |_| | |_| | | |  __/ |  \__ \ #
#  \___/ \__|_| |_|\___|_|  |___/ #
#                                 #
###################################

# Exports
export GPG_TTY="$(tty)"

# History

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

# vim keys
bindkey -v
export KEYTIMEOUT=1

# fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Commands at start of session
source $PYENV_ROOT/versions/3.7.3/envs/python/bin/activate
