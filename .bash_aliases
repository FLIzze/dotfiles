alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree="tree -I 'node_modules|.git'"
alias src=". ~/.bashrc"

gp() { 
    git add . && git commit -m "$1" && git push 
}

stty -ixon
bind -x '"\C-g": $HOME/Documents/dotfiles/scripts/.tmux-sessionizer'

alias d="docker"
alias ..="cd .."

# bash
alias sb=". ~/.bashrc"
alias eb="vim ~/.bashrc"
alias eba="vim ~/.bash_aliases"

# tmux
alias push=". $HOME/Documents/dotfiles/scripts/.push.sh"
alias nabu=". $HOME/Documents/dotfiles/scripts/.nabu.sh"

# time and battery info
alias i='echo "$(timedatectl | awk -F": " "/Local time/ {print \$2}")"; echo "BAT0: $(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)%"; echo "BAT1: $(cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)%"'

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
		clear
        cd "$selected" 
    else
        cd "$(dirname "$selected")" && vim "$(basename "$selected")"
    fi
}

# Add this to .bashrc
_fuzzyopen_keybind() {
    fuzzyopen
}

# Bind Ctrl+F to run the function
bind '"\C-f": "\C-a\C-k\C-u_fuzzyopen_keybind\n"'
