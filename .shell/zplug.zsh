zplug "supercrabtree/k"
zplug "djui/alias-tips"
zplug "paoloantinori/hhighlighter", as:command, use:"h.sh"
zplug "donnemartin/gitsome", use:"scripts/gh_complete.sh"
zplug "b4b4r07/enhancd", use:"init.sh"
zplug "Tarrasch/zsh-autoenv"
zplug "b4b4r07/emoji-cli"
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    use:"*darwin*amd64*", \
    rename-to:fzf
zplug "junegunn/fzf", \
	use:"shell/{completion,key-bindings}", \
	on:"junegunn/fzf-bin"

zplug "plugins/fasd", from:oh-my-zsh, if:'which fasd'
zplug "plugins/dircycle", from:oh-my-zsh
zplug 'plugins/pip', from:oh-my-zsh, if:'which pip'
# zplug 'plugins/pyenv', from:oh-my-zsh, if:'which pyenv'
zplug 'plugins/python', from:oh-my-zsh, if:'which python'
zplug 'plugins/osx', from:oh-my-zsh, if:'[[ $OSTYPE == *darwin* ]]'
zplug 'lib/clipboard', from:oh-my-zsh, if:'[[ $OSTYPE == *darwin* ]]'
zplug 'lib/compfix', from:oh-my-zsh
zplug 'lib/correction', from:oh-my-zsh
zplug 'lib/history', from:oh-my-zsh
zplug 'lib/spectrum', from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug 'zsh-users/zsh-completions', nice:10
zplug "zsh-users/zsh-history-substring-search", nice:11

zplug "nojhan/liquidprompt"
