#!/bin/bash

FRONT_SESSION="front"
FRONT_DIR="$HOME/Documents/Nabu/front"

API_SESSION="api"
API_DIR="$HOME/Documents/Nabu/api"

create_api() {
	tmux new-session -d -s "$API_SESSION" -c "$API_DIR" -n "vim"
	tmux send-keys -t "${API_SESSION}:vim" "vim src" C-m

	tmux new-window -t "$API_SESSION" -n "serve" -c "$API_DIR"
	tmux send-keys -t "${API_SESSION}:serve" "bun run dev" C-m

	tmux new-window -t "$API_SESSION" -n "tsc" -c "$API_DIR"
	tmux send-keys -t "${API_SESSION}:tsc" "tsc --noEmit --watch" C-m

	tmux select-window -t "${API_SESSION}:vim"
}

create_front() {
	tmux new-session -d -s "$FRONT_SESSION" -c "$FRONT_DIR" -n "vim"
	tmux send-keys -t "${FRONT_SESSION}:vim" "vim src" C-m

	tmux new-window -t "$FRONT_SESSION" -n "serve" -c "$FRONT_DIR"
	tmux send-keys -t "${FRONT_SESSION}:serve" "bun run dev" C-m

	tmux new-window -t "$FRONT_SESSION" -n "tsc" -c "$FRONT_DIR"
	tmux send-keys -t "${FRONT_SESSION}:tsc" "tsc --noEmit --watch" C-m

	tmux select-window -t "${FRONT_SESSION}:vim"
}

tmux has-session -t "$API_SESSION" 2>/dev/null || create_api
tmux has-session -t "$FRONT_SESSION" 2>/dev/null || create_front

if [ -n "$TMUX" ]; then
	tmux switch-client -t "$FRONT_SESSION"
else
	tmux attach-session -t "$FRONT_SESSION"
fi
