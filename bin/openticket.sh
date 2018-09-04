#!/bin/bash
if [ -z "$1" ]; then
    echo 'Error: no ticket number in arguments'
    exit 1
fi

cd ~/termsync
git fetch
if ! git checkout ticket_"$1"; then
  git checkout master
  git pull
  git checkout -b ticket_"$1"
fi
tmux a -t "$1" || mux start ts "$1"
