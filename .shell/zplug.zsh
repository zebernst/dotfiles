###
###
###
###

# manage zplug with zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

#================#
##### Themes #####
#================#

# zplug "denysdovhan/spaceship-zsh-theme", 		use:spaceship.zsh, from:github, as:theme 
zplug "geometry-zsh/geometry"
# zplug "nojhan/liquidprompt"
# zplug "mafredri/zsh-async", 					from:github # needed for pure theme
# zplug "sindresorhus/pure", 						use:pure.zsh, from:github, as:theme, on:"mafredri/zsh-async"


#=================#
##### Plugins #####
#=================#
zplug "supercrabtree/k"
zplug "djui/alias-tips"
zplug "paoloantinori/hhighlighter", 			as:command, use:"h.sh"
zplug "donnemartin/gitsome", 					use:"scripts/gh_complete.sh" # gitsome is installed with pip, this installs completion
zplug "b4b4r07/enhancd", 						use:"init.sh"
# zplug "b4b4r07/emoji-cli"
zplug "junegunn/fzf-bin", 						from:gh-r, as:command, use:"*darwin*amd64*", rename-to:fzf
zplug "junegunn/fzf", 							use:"shell/{completion,key-bindings}", on:"junegunn/fzf-bin"
			
#=========================#
#### Oh-My-Zsh Plugins ####
#=========================#
zplug "plugins/dircycle", 						from:oh-my-zsh
zplug 'plugins/python', 						from:oh-my-zsh, if:'which python'
zplug 'plugins/osx', 							from:oh-my-zsh, if:'[[ $OSTYPE == *darwin* ]]'
zplug 'plugins/colored-man-pages',				from:oh-my-zsh
zplug "plugins/sublime", 						from:oh-my-zsh
zplug 'lib/clipboard', 							from:oh-my-zsh, if:'[[ $OSTYPE == *darwin* ]]'
# # zplug 'lib/compfix', 							from:oh-my-zsh
zplug 'lib/correction', 						from:oh-my-zsh
zplug 'lib/completion', 						from:oh-my-zsh
zplug 'lib/history', 							from:oh-my-zsh
zplug 'lib/spectrum', 							from:oh-my-zsh


zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2 #on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3 #on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
