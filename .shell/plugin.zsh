# activate iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $( (git branch 2> /dev/null ) | grep \* | cut -c3- )
}

# activate prompt settings
# source "$HOME/.config/spaceshippromptrc"
source "$HOME/.config/geometrypromptrc"

# setup fasd
fasd_cache="$CACHE_DIR/.fasd-init"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# direnv
eval "$(direnv hook zsh)"

# thefuck
eval "$(thefuck --alias)"

# activate automatic brewfile updating
if [ -f $(brew --prefix)/etc/brew-wrap ]; then
  source $(brew --prefix)/etc/brew-wrap
fi

# activate mactex
#eval `/usr/libexec/path_helper -s`

# activate pyenv
if which pyenv > /dev/null; then 
	eval "$(pyenv init -)"; 
fi
if which pyenv-virtualenv-init > /dev/null; then
	eval "$(pyenv virtualenv-init -)";
fi

# activate itermocil completion
#compctl -g '~/.teamocil/*(:t:r)' itermocil

# alias hub as git
# eval "$(hub alias -s)" # turning this off so that my git alias command will work. workaround is in git config.
