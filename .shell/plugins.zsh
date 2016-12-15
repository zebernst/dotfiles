# activate iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $( (git branch 2> /dev/null ) | grep \* | cut -c3- )
}

# set ls colors (command defined in functions.zsh)
ls_colorconfig --set

# thefuck
eval "$(thefuck --alias)"

# activate automatic brewfile updating
if [ -f $(brew --prefix)/etc/brew-wrap ]; then
  source $(brew --prefix)/etc/brew-wrap
fi

# activate mactex
eval `/usr/libexec/path_helper -s`

# activate pyenv
if which pyenv > /dev/null; then 
	eval "$(pyenv init -)"; 
fi
if which pyenv-virtualenv-init > /dev/null; then
	eval "$(pyenv virtualenv-init -)";
fi

# activate jenv
if which jenv > /dev/null; then
	eval "$(jenv init -)";
fi

# activate rbenv
eval "$(rbenv init -)"

# activate itermocil completion
compctl -g '~/.teamocil/*(:t:r)' itermocil

# alias hub as git
eval "$(hub alias -s)"