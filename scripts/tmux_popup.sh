#!/bin/bash
width=${2:-75%}
height=${2:-75%}
tmux popup -d '#{pane_current_path}' -b padded -w $width -h $height -E "$SHELL"
