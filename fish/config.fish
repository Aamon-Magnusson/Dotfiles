if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
end

alias pacman="sudo pacman"
alias ..="cd .."
alias grep="grep --color=auto"
alias ran="ranger"

starship init fish | source
