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

alias pacman="sudo pacman"
alias ..="cd .."
alias grep="grep --color=auto"
alias ran="ranger"

# git aliases
alias gc="git commit -a"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff"

starship init fish | source
