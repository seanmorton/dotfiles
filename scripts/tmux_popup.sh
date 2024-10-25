#!/bin/bash
# Thanks to https://blog.meain.io/2020/tmux-flating-scratch-terminal/
width=${2:-100%}
height=${2:-65%}
if [[ "$(tmux display-message -p "#{session_name}")" == "float"* ]]; then
    tmux detach-client
else
    WINDOW_IDX=$(tmux display -p '#{active_window_index}')
    tmux popup -d '#{pane_current_path}' -b simple -y 0 -w $width -h $height -E "tmux attach -t float-$WINDOW_IDX || tmux new -s float-$WINDOW_IDX"
fi
