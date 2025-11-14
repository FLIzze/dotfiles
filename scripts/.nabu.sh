#!/bin/bash

CLIENT_SESSION="Nabu"
ROOT_DIR="$HOME/Documents/Nabu/WEBSITE"

if ! tmux has-session -t "$CLIENT_SESSION" 2>/dev/null; then
    tmux new-session -d -s "$CLIENT_SESSION" -c "$ROOT_DIR" -n "vim"
    tmux send-keys -t "$CLIENT_SESSION:vim" "vim src" C-m

    tmux new-window -t "$CLIENT_SESSION" -n "serve" -c "$ROOT_DIR"
    tmux send-keys -t "$CLIENT_SESSION:serve" "bun run dev" C-m

    tmux new-window -t "$CLIENT_SESSION" -n "tsc" -c "$ROOT_DIR"
    tmux send-keys -t "$CLIENT_SESSION:tsc" "tsc --noEmit --watch" C-m

    tmux select-window -t "$CLIENT_SESSION:vim"
fi

tmux attach-session -t "$CLIENT_SESSION"
