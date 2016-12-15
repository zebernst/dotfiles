# Executes commands at the start of an interactive session.
#=========================================================

# Set zsh options and load zle widgets
source "$HOME/.shell/setopts.zsh"

# Define functions
source "$HOME/.shell/functions.zsh"

# load plugins
source "$HOME/.shell/plugins.zsh"
source "$ZPLUG_HOME/init.zsh"
zplug check || zplug install
zplug load

# Define aliases
source "$HOME/.shell/aliases.zsh"
