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

abbr p="sudo pacman"
abbr ..="cd .."
alias grep="grep --color=auto"
abbr ran="ranger"

export PAGER="most"

# git aliases
abbr gc="git commit -a"
abbr gp="git push"
abbr gpl="git pull"
abbr gd="git diff"
abbr ga="git add ."

starship init fish | source
