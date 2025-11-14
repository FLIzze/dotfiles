#!/bin/bash

CLIENT_SESSION="client"
CLIENT_EXISTS=$(tmux list-sessions | grep $CLIENT_SESSION)

if [ "$CLIENT_EXISTS" = "" ]; then
    tmux new-session -d -s $CLIENT_SESSION

    tmux new-window -t $CLIENT_SESSION:1 -n "nvim"
    tmux send-keys -t $CLIENT_SESSION:1 "cd ~/Documents/push && nvim ." C-m

    tmux new-window -t $CLIENT_SESSION:2 -n "server"
    tmux send-keys -t $CLIENT_SESSION:2 "cd ~/Documents/push/server && bun main.ts" C-m

    tmux new-window -t $CLIENT_SESSION:3 -n "client"
    tmux send-keys -t $CLIENT_SESSION:3 "cd ~/Documents/push/client && bun run dev" C-m

    tmux select-window -t $CLIENT_SESSION:1
fi

tmux attach-session -t $CLIENT_SESSION
