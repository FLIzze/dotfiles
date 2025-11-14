#!/bin/bash

CLIENT_SESSION="Nabu"
CLIENT_EXISTS=$(tmux list-sessions | grep $CLIENT_SESSION)

if [ "$CLIENT_EXISTS" = "" ]; then
    tmux new-session -d -s $CLIENT_SESSION

    tmux new-window -t $CLIENT_SESSION:1 -n "vim"
    tmux send-keys -t $CLIENT_SESSION:1 "cd ~/Documents/Nabu/WEBSITE/src && vim ." C-m

    tmux new-window -t $CLIENT_SESSION:2 -n "serve"
    tmux send-keys -t $CLIENT_SESSION:2 "cd ~/Documents/Nabu/WEBSITE/ && bun run dev" C-m

    tmux new-window -t $CLIENT_SESSION:3 -n "tsc"
    tmux send-keys -t $CLIENT_SESSION:3 "cd ~/Documents/Nabu/WEBSITE/ && tsc --noEmit --watch" C-m

    tmux select-window -t $CLIENT_SESSION:1
fi

tmux attach-session -t $CLIENT_SESSION
