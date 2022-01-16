zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
