alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree="tree -I 'node_modules|.git'"
alias src=". ~/.bashrc"

gp() { 
    git add . && git commit -m "$1" && git push 
}

stty -ixon
bind -x '"\C-g": $HOME/Documents/dotfiles/tmux/.tmux-sessionizer'

alias d="docker"
alias ..="cd .."

# bash
alias sb=". ~/.bashrc"
alias eb="vim ~/.bashrc"
alias eba="vim ~/.bash_aliases"

# time
alias t="timedatectl"

# tmux
alias push=". $HOME/Documents/dotfiles/tmux/.push.sh"
alias nabu=". $HOME/Documents/dotfiles/tmux/.nabu.sh"

# time and battery info
alias i='echo "$(timedatectl | awk -F": " "/Local time/ {print \$2}")"; echo "BAT0: $(cat /sys/class/power_supply/BAT0/capacity)%"; echo "BAT1: $(cat /sys/class/power_supply/BAT1/capacity)%"'

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
        cd "$(dirname "$selected")" && vim "$(basename "$selected")"
    fi
}

bind -x '"\C-f": fuzzyopen'
