#!/bin/bash
# Thanks to https://blog.meain.io/2020/tmux-flating-scratch-terminal/
width=${2:-100%}
height=${2:-65%}
if [[ "$(tmux display -p "#{session_name}")" == "float"* ]]; then
    tmux detach-client
else
    SESSION_NAME=$(tmux display -p '#{session_name}')
    WINDOW_IDX=$(tmux display -p '#{active_window_index}')
    tmux popup -d '#{pane_current_path}' -b simple -y 0 -w $width -h $height -E "tmux attach -t float-$SESSION_NAME-$WINDOW_IDX || tmux new -s float-$SESSION_NAME-$WINDOW_IDX"
fi
