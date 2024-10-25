#!/bin/bash
width=${2:-75%}
height=${2:-75%}
if [[ "$(tmux display-message -p "#{session_name}")" == "float"* ]]; then
    tmux detach-client
else
    WINDOW_IDX=$(tmux display -p '#{active_window_index}')
    tmux popup -d '#{pane_current_path}' -b padded -w $width -h $height -E "tmux attach -t float-$WINDOW_IDX || tmux new -s float-$WINDOW_IDX"
fi
