#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

curr_session=$(tmux display-message -p "#S")

tmux new-window -n "fdp" -e FDP_WINDOW="$curr_session:fdp"
tmux send fdp ENTER
