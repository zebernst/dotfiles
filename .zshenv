#
# Defines environment variables.
#

export CACHE_DIR="$HOME/.cache"
[[ ! -d "${CACHE_DIR}" ]] && mkdir -p "${CACHE_DIR}"

# Paths
typeset -U path fpath manpath
typeset -UT INFOPATH infopath

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/opt/python/libexec/bin
  /opt/local/{bin,sbin}
  /usr/local/opt/ruby/bin
  $HOME/.bin
  $path
)

# set the directories that Zsh searches for functions
fpath=(
  ~/.shell/fns
  $fpath
)

# Set the list of directories that info searches for manuals.
infopath=(
  /opt/local/share/info
  /usr/local/share/info
  /usr/share/info
  $infopath
)

# Set the list of directories that man searches for manuals.
manpath=(
  /opt/local/share/man
  /usr/local/share/man
  /usr/share/man
  $manpath
)

# Set name to show in prompt.
export DEFAULT_USER="Zach"

export EDITOR='vim'

export PAGER="less"
export MANPAGER="less -is"


# get gpg to work
export GPG_TTY=$(tty)


# Set environment variables for version managers. 
# export PYENV_ROOT=/usr/local/var/pyenv
# export JENV_ROOT=/usr/local/var/jenv

export ZPLUG_HOME=/usr/local/opt/zplug
export ZPLUG_LOADFILE="$HOME/.shell/zplug.zsh"
export ZPLUG_CACHE_DIR="$CACHE_DIR/zplug"

# Set options for Homebrew and related programs.
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_BREWFILE="$HOME/.config/brewfile/Brewfile"
export HOMEBREW_BREWFILE_BACKUP="$HOME/.config/brewfile/Brewfile.bak"
export HOMEBREW_BREWFILE_ON_REQUEST="1"
#export HOMEBREW_BREWFILE_TOP_PACKAGES=ffmpeg,pandoc,pyenv,sphinx-doc,sqlite,zsh

# Set options for fasd.
export _FASD_DATA="${CACHE_DIR}/.fasd" # set fasd data file location
export _FASD_BACKENDS="native spotlight"

# Set options for zsh-autoenv
#export AUTOENV_FILE_ENTER=".env"
#export AUTOENV_FILE_LEAVE=".env_out"
