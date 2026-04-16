#!/bin/bash

FRONT_SESSION="ratio"
FRONT_DIR="$HOME/Documents/CEREBRO"

create_front() {
    tmux new-session -d -s "$FRONT_SESSION" -n "vim" -c "$FRONT_DIR"
    tmux send-keys -t "${FRONT_SESSION}:vim" "vim ." C-m

    tmux new-window -t "$FRONT_SESSION" -n "bob" -c "$FRONT_DIR"
    tmux send-keys -t "${FRONT_SESSION}:bob" "ssh bob@10.42.0.11 'cd ~/Documents/CEREBRO && docker compose up'" C-m

    tmux new-window -t "$FRONT_SESSION" -n "metrics" -c "$FRONT_DIR"
	tmux send-keys -t "${FRONT_SESSION}:metrics" "ssh -t bob@10.42.0.11 'btop'" C-m

    tmux select-window -t "${FRONT_SESSION}:vim"
}

tmux has-session -t "$FRONT_SESSION" 2>/dev/null || create_front

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$FRONT_SESSION"
else
    tmux attach-session -t "$FRONT_SESSION"
fi
