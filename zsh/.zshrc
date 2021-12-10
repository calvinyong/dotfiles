################################
#              __              #
#  ____  _____/ /_  __________ #
# /_  / / ___/ __ \/ ___/ ___/ #
#  / /_(__  ) / / / /  / /__   #
# /___/____/_/ /_/_/   \___/   #
#                              #
################################


# Load all stock functions (from $fpath files) called below.
autoload -U compaudit compinit

ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-$(hostname)-${ZSH_VERSION}"
compinit -i -C -d "${ZSH_COMPDUMP}"

# Completion
zmodload zsh/complist

zstyle ':completion:*:*:*:*:*' menu select
# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# _ and - are interchangable
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'


##########
# Colors #
##########

# Theme and appearance
# ls colors
autoload -U colors && colors

# Correct colors in tab completion
if [[ -z "$LS_COLORS" ]]; then
    (( $+commands[dircolors] )) && eval "$(dircolors -b)"
fi

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


#######
# URL #
#######

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic


###########
# Options #
###########

# Vim keys
KEYTIMEOUT=1
bindkey -v

setopt AUTO_CD
# Allow comments in interactive mode
setopt INTERACTIVECOMMENTS
# Disable C-s to freeze terminal
unsetopt FLOWCONTROL

###########
# History #
###########

HISTSIZE=2000
SAVEHIST=2000
HISTFILE=$XDG_CACHE_HOME/zsh/history
setopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_VERIFY             # Show command with history expansion to user before running it


###########
# Aliases #
###########

unalias -m '*'

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
alias ip='ip -c'

# Program aliases
alias vim='nvim'
alias more='less'
alias df='df -h'
alias cat='bat --theme base16'
alias ytdl-audio="yt-dlp --config-location $XDG_CONFIG_HOME/ytdl/audio.conf"
alias ytdl-video="yt-dlp --config-location $XDG_CONFIG_HOME/ytdl/video.conf"

# XDG Compliance
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

# Other aliases
alias ssh-termux='adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022'
alias weather='curl wttr.in'


##########
# Prompt #
##########

setopt PROMPT_SUBST

PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'
#PROMPT+='%{$fg[magenta]%}$HOST %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


###########
# Sources #
###########

# fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/git.zsh
source $XDG_CONFIG_HOME/zsh/git.zsh

# https://github.com/zdharma/fast-syntax-highlighting
source $XDG_CONFIG_HOME/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

#
# Other useful options
#

# Vim keys in tab complete menu
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

#setopt long_list_jobs
