#———————————————————————————————————————————————————————————————
# shell functions
#———————————————————————————————————————————————————————————————

alias src="source $HOME/.zshrc && echo Reloaded zshrc" 		# source zshrc file

alias _='sudo'

#———————————————————————————————————————————————————————————————
# filesystem
#———————————————————————————————————————————————————————————————

alias ax="chmod a+x" # grants permission to execute

#———————————————————————————————————————————————————————————————
# navigation
#———————————————————————————————————————————————————————————————

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias oo="echo 'use ofd'" 		# open current path in finder

# push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# autopushd options
# alias 1='cd -'
# alias 2='cd -2'
# alias 3='cd -3'
# alias 4='cd -4'
# alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'

alias md='mkdir -p'				# make a directory (and the path required to reach it)
alias rd='rmdir'				# remove the specified directory (and the the path required to reach it)

alias ls="ls -FG" 				# list files (display filetype and use colorized output)
alias la="ls -AFG" 				# list all files
alias ll="ls -AhoFG" 			# long list files

alias k="k -Ah"					# list all directories and display human filesizes
# alias tree="tree -C" 			# use tree with colored output
alias exa="exa -a"				# automatically display hidden files with exa
alias tree="exa -aT"			# same as above but use exa instead

# alias gls="gls -F --color=auto"			# GNU list files
# alias gla="gls -AF --color=auto"			# GNU list all files
# alias gll="gls -AhoF --color=auto"		# GNU long list files


#———————————————————————————————————————————————————————————————
# re-aliasing programs
#———————————————————————————————————————————————————————————————

alias vim="mvim -v" 			# use macvim instead of regular vim

alias pyvenv='pyenv virtualenv'

# set git to work correctly when in dotfiles directory
# alias git="[[ $PWD =~ $HOME/.dotfiles ]] && hub --git-dir=$HOME/.dotfiles --work-tree=$HOME || hub"
#-C $HOME


#———————————————————————————————————————————————————————————————
# fasd
#———————————————————————————————————————————————————————————————

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

alias o='fasd -ae open'  # open

#———————————————————————————————————————————————————————————————
# git
#———————————————————————————————————————————————————————————————

alias g='git'

# alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'

# alias gclean='git clean -fd'
# alias gpristine='git reset --hard && git clean -dfx'

# alias ggpull='git pull origin $(git symbolic-ref --short -q HEAD)'
# alias ggpush='git push origin $(git symbolic-ref --short -q HEAD)'

# alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'
# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'


#———————————————————————————————————————————————————————————————
# networking
#———————————————————————————————————————————————————————————————

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" 					# Get readable list of network IPs
alias myip="dig +short myip.opendns.com @resolver1.opendns.com;ipconfig getifaddr en1" 		# Print external and internal IP addresses

#———————————————————————————————————————————————————————————————
# miscellaneous
#———————————————————————————————————————————————————————————————

alias volmute="osascript -e 'set volume output muted true'" # mute volume
alias volfull="osascript -e 'set volume 10'" # full volume

alias ql="quick-look" # preview a file using QuickLook

alias cl="fc -e -|pbcopy" # copy output of last command to clipboard
alias cpwd='pwd|tr -d "\n"|pbcopy' # copy the working directory path to clipboard

alias jk='bundle exec jekyll'
alias jks='bundle exec jekyll serve --incremental'
alias jkss='bundle exec jekyll serve --detach'
alias jkk='pkill -f jekyll'








