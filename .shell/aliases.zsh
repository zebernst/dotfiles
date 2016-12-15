#———————————————————————————————————————————————————————————————
# shell functions
#———————————————————————————————————————————————————————————————

alias src="source $HOME/.zshrc && echo Reloaded zshrc" # source zshrc file

alias _='sudo'

#———————————————————————————————————————————————————————————————
# filesystem functions
#———————————————————————————————————————————————————————————————

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias oo="open -a Finder ./" # open current path in finder

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

alias md='mkdir -p'
alias rd='rmdir'
alias d='dirs -v | head -10'

alias ls="ls -FG" 									# list files
alias la="ls -AFG" 									# list all files
alias ll="ls -AhoFG" 								# long list files

# alias gls="gls -F --color=auto"			# GNU list files
# alias gla="gls -AF --color=auto"			# GNU list all files
# alias gll="gls -AhoF --color=auto"		# GNU long list files

alias show_hidden="defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder"
alias hide_hidden="defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder"

# push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

alias mmv='noglob zmv -W' # mv with pattern matching

alias lscolors="ls_colorconfig --list"

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

alias ga='git add'
alias gaa='git add --all'
# alias gapa='git add --patch'

alias gb='git branch'
alias gba='git branch -a'
alias gbda='git branch --merged | command grep -vE "^(\*|\s*master\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcs='git commit -S'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gg='git gui citool'
alias gga='git gui citool --amend'

alias ggpull='git pull origin $(git symbolic-ref --short -q HEAD)'
alias ggpush='git push origin $(git symbolic-ref --short -q HEAD)'
alias ggsup='git branch --set-upstream-to=origin/$(git symbolic-ref --short -q HEAD)'
alias ggpur='ggu'
alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=format:%h)'

alias gl='git pull'
alias glg='git log --stat --color'
alias glgp='git log --stat --color -p'
alias glgg='git log --graph --color'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate --color'
alias glol="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --color --graph'
alias glp="_git_log_prettily"

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash'
alias gstaa='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gvt='git verify-tag'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "--wip--"'

#———————————————————————————————————————————————————————————————
# networking
#———————————————————————————————————————————————————————————————

alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" # Get readable list of network IPs
alias myip="dig +short myip.opendns.com @resolver1.opendns.com;ipconfig getifaddr en1" # Print external and internal IP addresses
alias flush="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder;echo DNS flushed" # Flush DNS cache
alias ping="ping -c 5" # ping 5 times ‘by default’

#———————————————————————————————————————————————————————————————
# miscellaneous
#———————————————————————————————————————————————————————————————

alias ax="chmod a+x" # grants permission to execute

alias colorref="spectrum_tb"

alias volmute="osascript -e 'set volume output muted true'" # mute volume
alias volfull="sudo osascript -e 'set volume 10'" # full volume

alias ql="qlmanage -p 2>/dev/null" # preview a file using QuickLook

alias cl="fc -e -|pbcopy" # copy output of last command to clipboard
alias cpwd='pwd|tr -d "\n"|pbcopy' # copy the working directory path to clipboard

alias jk='bundle exec jekyll'
alias jks='bundle exec jekyll serve --incremental'
alias jkss='bundle exec jekyll serve --detach'
alias jkk='pkill -f jekyll'

alias edi='nohup bot-lifesupport.sh &>/dev/null &'

alias npmls='npm list -g --depth=0'
alias pyvenv='pyenv virtualenv'
