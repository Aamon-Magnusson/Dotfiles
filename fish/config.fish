if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

function fish_user_key_bindings
  fish_vi_key_bindings
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
   		eval command sudo $history[1]
	else
    	command sudo $argv
    end
end

function ex --description "Function to detect compression to decompress the file"
	if test -f "$argv"
		switch $argv
			case '*.tar.bz2'
				tar xjf $argv
			case '*.tar.gz'
				tar xzf $argv
			case '*.bz2'
				bunzip2 $argv
			case '*.rar'
				unrar x $argv
			case '*.gz'
				gunzip $argv
			case '*.tar'
				tar xf $argv
			case '*.tbz2'
				tar xjf $argv
			case '*.tgz'
				tar xzf $argv
			case '*.zip'
				unzip $argv
			case '*.Z'
				uncompress $argv
			case '*.7z'
				7z x $argv
			case '*.deb'
				ar x $argv
			case '*.tar.xz'
				tar xf $argv
			case '*.zst'
				unzstd $argv
			case '*'
				echo "'$argv' cannot be extracted via ex()"
		end
	else
		echo "'$argv' is not a valid file"
	end
end

function vv
	fzf | xargs nvim
end

function vh
	cd ~/ && fzf | xargs nvim && cd -
end

function vc
	cd ~/.config && fzf | xargs nvim && cd -
end

function vp
	cd ~/Programming && fzf | xargs nvim && cd -
end

function vu
	cd ~/Drives && fzf | xargs nvim && cd -
end

function c
	cd (fd --type d | fzf)
end

function ch
	cd ~/ && cd (fd --type d | fzf)
end

function cc
	cd ~/.config && cd (fd --type d | fzf)
end

function cpr # realized that cp is a command
	cd ~/Programming && cd (fd --type d | fzf)
end

function cu
	cd ~/Drives && cd (fd --type d | fzf)
end

#export LESS_TERMCAP_mb=$'\E[01;32m'
#export LESS_TERMCAP_md=$'\E[01;32m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;47;34m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;36m'
#export LESS=-R

alias grep "grep --color=auto"
alias less "less --use-color"
alias df "df --human-readable"
abbr p "sudo pacman"
abbr ran "ranger"
abbr v "nvim"
alias h "set h (history | fzf); $h"

function h
	set temp (history | fzf)
	eval $temp
end

# ls aliases
alias lsd "lsd --group-dirs first"
abbr l "lsd"
#abbr ls "lsd" # trying to force myself to use just l
abbr "la" "lsd -al"

# movement commands
abbr .. "cd .."
abbr cdp "cd ~/Programming"
abbr cdw "cd ~/Programming/AamonDwm"
abbr cdf "cd ~/Programming/Dotfiles"
abbr cdu "cd ~/Drives"
abbr cdc "cd ~/.config"

# git aliases
abbr gc "git commit -a"
abbr gp "git push"
abbr gpl "git pull"
abbr gd "git diff"
abbr gt "git difftool"
abbr gs "git status"
abbr ga "git add ."
abbr gm "git mergetool"

# Jekyll stuff (For Markdown)
# export GEM_HOME="$HOME/gems"
# export PATH="$HOME/gems/bin:$PATH"

function jg
	cd $(git rev-parse --show-toplevel) && bundle exec jekyll serve --trace
end

starship init fish | source
