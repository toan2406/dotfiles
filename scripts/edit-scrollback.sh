#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

file=`mktemp`.sh
tmux capture-pane -pS -32768 > $file
tmux new-window -n:tmp "nvim '+ normal G $' $file"
