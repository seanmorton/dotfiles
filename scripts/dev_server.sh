#!/bin/sh
sigint_handler()
{
  kill $PID
  exit
}

trap sigint_handler SIGINT

while true; do
  $@ &
  PID=$!
  sleep 3
  fswatch -r1 -e "\\.swp$" -e "\\.swx$" .
  kill $PID
done

