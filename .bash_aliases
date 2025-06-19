gp() { 
    git add . && git commit -m "$1" && git push 
}

stty -ixon
bind -x '"\C-g": $HOME/Documents/confs/tmux-sessionizer'

alias d="docker"
alias nv="nvim"

alias ia="ssh bob@192.178.10.2"
alias dex="$HOME/Documents/confs/tmux_dex"
alias kctl="minikube kubectl --"

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
