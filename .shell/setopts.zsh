# Edit the current command line in $EDITOR
zmodload zsh/terminfo
autoload -U edit-command-line && zle -N edit-command-line
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit
autoload -U zmv
autoload -U up-line-or-beginning-search && zle -N up-line-or-beginning-search
autoload -U down-line-or-beginning-search && zle -N down-line-or-beginning-search


setopt auto_cd
setopt cdablevars

setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

setopt interactivecomments

setopt multios

unsetopt incappendhistory

COMPLETION_WAITING_DOTS="true"
