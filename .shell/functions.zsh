# open man page in Preview
pman() {
	man -t "${1}" | open -f -a /Applications/Preview.app;
}
# open man page in Textmate
tman() {
	MANWIDTH=160 MANPAGER='col -bx' man $@ | mate;
}

# use colored man pages
man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

# find and list processes matching a partial-match string
fp() {
	ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

# build menu to kill processes listed with fp
fk () {
	IFS=$'\n'
	PS3='Kill which process? (1 to cancel): '
	select OPT in "Cancel" $(fp $1); do
		if [ $OPT != "Cancel" ]; then
			kill $(echo $OPT|awk '{print $NF}')
		fi
		break
	done
	unset IFS
}

# cd to the path of the front Finder window
cdf() {
	target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
	if [ "$target" != "" ]; then
		cd "$target"; pwd
	else
		echo 'No Finder window found' >&2
	fi
}
# choose cd dir from fzf menu (fuzzy search 3 levels deep)
cdd() {
	local needle=$(echo "$*" | sed -E 's/ +/.*/g')
	cd "`find . -type d -maxdepth 3 | grep -Ei "${needle}[^/]*$" | fzf -s 20 -1 -0 -q "$1"`"
}

# list top 20 frequently used commands
zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " "CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | n |  head -n20
}

# update all programs (todo: modify for my use)
# brew cask upgrade is a custom shell script
update() {
  local brew  = "brew update && brew upgrade && brew cask upgrade && brew cleanup && brew cask cleanup;"
  local gem   = "gem update;"
  local pip   = "pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
  sh -c $brew; sudo sh -c $gem$pip
}

# set ls colors
ls_colorconfig() {
	# create local associative arrays
	local -A lsfg lsbg ft

	# assign color codes
	lsfg[clr]="x"			# default foreground or background
	lsfg[blk]="a"	 		# black
	lsfg[red]="b"	 		# red
	lsfg[grn]="c"	 		# green
	lsfg[brn]="d"	 		# brown
	lsfg[blu]="e"	 		# blue
	lsfg[pnk]="f"	 		# magenta
	lsfg[cyn]="g"	 		# cyan
	lsfg[gry]="h"	 		# light grey
	lsfg[b_blk]="A" 	# bold black, usually shows up as dark grey
	lsfg[b_red]="B" 	# bold red
	lsfg[b_grn]="C" 	# bold green
	lsfg[b_brn]="D" 	# bold brown, usually shows up as yellow
	lsfg[b_blu]="E" 	# bold blue
	lsfg[b_pnk]="F" 	# bold magenta
	lsfg[b_aqa]="G" 	# bold cyan
	lsfg[b_gry]="H"		# bold light grey; looks like bright white

	lsbg[clr]="x"			# default foreground or background
	lsbg[blk]="a"	 		# black
	lsbg[red]="b"	 		# red
	lsbg[grn]="c"	 		# green
	lsbg[brn]="d"	 		# brown
	lsbg[blu]="e"	 		# blue
	lsbg[pnk]="f"	 		# magenta
	lsbg[cyn]="g"	 		# cyan
	lsbg[gry]="h"	 		# light grey
	lsbg[b_blk]="A" 	# bold black, usually shows up as dark grey
	lsbg[b_red]="B" 	# bold red
	lsbg[b_grn]="C" 	# bold green
	lsbg[b_brn]="D" 	# bold brown, usually shows up as yellow
	lsbg[b_blu]="E" 	# bold blue
	lsbg[b_pnk]="F" 	# bold magenta
	lsbg[b_aqa]="G" 	# bold cyan
	lsbg[b_gry]="H"		# bold light grey; looks like bright white

	# assign filetype positions
	ft[dir]=$lsfg[blu]$lsbg[clr]	# 1.   directory
	ft[lns]=$lsfg[pnk]$lsbg[clr]	# 2.   symbolic link
	ft[skt]=$lsfg[grn]$lsbg[clr]	# 3.   socket
	ft[pip]=$lsfg[brn]$lsbg[clr]	# 4.   pipe
	ft[exe]=$lsfg[red]$lsbg[clr]	# 5.   executable
	ft[blk]=$lsfg[blu]$lsbg[cyn]	# 6.   block special
	ft[chr]=$lsfg[blu]$lsbg[brn]	# 7.   character special
	ft[uid]=$lsfg[blk]$lsbg[red]	# 8.   executable with setuid bit set
	ft[gid]=$lsfg[blk]$lsbg[cyn]	# 9.   executable with setgid bit set
	ft[dws]=$lsfg[blk]$lsbg[grn]	# 10.  directory writable to others, with sticky bit
	ft[dw_]=$lsfg[blk]$lsbg[brn]	# 11.  directory writable to others, without sticky bit

	if [[ $1 = "--set" ]]; then
		# set global variable
		export LSCOLORS="$ft[dir]$ft[lns]$ft[skt]$ft[pip]$ft[exe]$ft[blk]$ft[chr]$ft[uid]$ft[gid]$ft[dws]$ft[dw_]"
	fi

	if [[ $1 = "--list" ]]; then
		printf '%b\n' "[<COLORCODE>mDirectory[00m"
		printf '%b\n' "[<COLORCODE>mSymbolic Link[00m"
		printf '%b\n' "[<COLORCODE>mSocket[00m"
		printf '%b\n' "[<COLORCODE>mPipe[00m"
		printf '%b\n' "[<COLORCODE>mExecutable[00m"
		printf '%b\n' "[<COLORCODE>mBlock device[00m"
		printf '%b\n' "[<COLORCODE>mCharacter device[00m"
		printf '%b\n' "[<COLORCODE>mExecutable with setuid bit[00m"
		printf '%b\n' "[<COLORCODE>mExecutable with setgid bit[00m"
		printf '%b\n' "[<COLORCODE>mWritable Directory with sticky bit[00m"
		printf '%b\n' "[<COLORCODE>mWritable Directory without sticky bit[00m"
	fi
}

# UNFINISHED: ask for confirmation before unquarantining file
unisolate() {
	attrib=$(xattr $1)
	if [ attrib == "com.apple.quarantine" ]; then

		xattr -d com.apple.quarantine $1
	fi
}

# usage: numpng /path/to/png/directory/*.png SEQUENCE_NAME
numpng() {
	i=1 base='$2' zmv '$1' '${base}_${(l:4::0:)$((i++))}.png'
}

# usage: mogrpng
mogrpng() {
	for i in *.bmp; 
		do mogrify -format png "$i" && rm "$i"; 
		echo "$i converted to ${i%.*}.png"; 
	done
}

# usage: mkdirlist list.txt
mkdirlist() {
	cat $1 | xargs mkdir
}
