#!/bin/bash
# Thanks to https://blog.meain.io/2020/tmux-flating-scratch-terminal/
width=${2:-75%}
height=${2:-75%}
if [ "$(tmux display-message -p -F "#{session_name}")" = "float" ];then
    tmux detach-client
else
    tmux popup -d '#{pane_current_path}' -w$width -h$height -E "tmux attach -t float || tmux new -s float"
fi
