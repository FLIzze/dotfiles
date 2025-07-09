alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias push=". $HOME/Documents/dotfiles/tmux/.push.sh"
alias vim="nvim"

gp() { 
    git add . && git commit -m "$1" && git push 
}

stty -ixon
bind -x '"\C-g": $HOME/Documents/dotfiles/tmux/.tmux-sessionizer'

alias d="docker"
alias ..="cd .."

fuzzyopen() {
    local selected=$(fd . "$HOME" \
        --type f --type d \
        --exclude 'node_modules' \
        --exclude '.git' \
        --hidden \
        --exclude '.*' \
        | fzf)

    [[ -z "$selected" ]] && return

    if [[ -d "$selected" ]]; then
        cd "$selected" 
    else
        cd "$(dirname "$selected")" && nvim "$(basename "$selected")"
    fi
}

bind -x '"\C-f": fuzzyopen'
