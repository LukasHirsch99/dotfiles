#!/bin/bash

selected_name=$(basename "$selected" | tr . _)

if ! tmux has-session -t "ncspot" 2> null; then
    tmux new-session -ds "ncspot" -c "~" ncspot
    tmux select-window -t "ncspot"
fi

if [ -n "$TMUX"]; then
  tmux attach-session -t "ncspot"
else
  tmux switch-client -t "ncspot"
fi
