#!/bin/bash
if [ -z "$1" ]; then
  echo 'Error: no ticket number in arguments'
  exit 1
fi

git checkout master
git branch -d ticket_"$1"
tmux kill-session -t "$1"
