if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
    eval command sudo $history[1]
else
    command sudo $argv
    end
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
abbr p "sudo pacman"
abbr ran "ranger"
abbr v "vim"

# movement commands
abbr .. "cd .."
abbr cdp "cd ~/Programming"
abbr cdw "cd ~/Programming/AamonDwm"
abbr cdf "cd ~/Programming/Dotfiles"
abbr cdu "cd ~/Drives"

# git aliases
abbr gc "git commit -a"
abbr gp "git push"
abbr gpl "git pull"
abbr gd "git diff"
abbr ga "git add ."

starship init fish | source
