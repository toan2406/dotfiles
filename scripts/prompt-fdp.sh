#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

temp_session="__fdp__"
curr_session=$(tmux display-message -p "#S:#W")

tmux new-session -d -s $temp_session -c $HOME
tmux set-environment -t $temp_session PREV_SESSION $curr_session
tmux send -t $temp_session fdp ENTER
tmux switch-client -t $temp_session
