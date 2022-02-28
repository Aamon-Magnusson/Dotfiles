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

export PAGER="most"

abbr p "sudo pacman"
alias grep "grep --color=auto"
abbr ran "ranger"

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
