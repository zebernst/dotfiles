# Executes commands at the start of an interactive session.
#=========================================================

# set zsh options and load zle widgets
source "$HOME/.shell/setopts.zsh"

# load functions
source "$HOME/.shell/functions.zsh"

# load plugins
source "$HOME/.shell/plugins.zsh"
source "$ZPLUG_HOME/init.zsh"
zplug check || zplug install
zplug load

# define aliases
source "$HOME/.shell/aliases.zsh"
