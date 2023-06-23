#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

search=$(tmux list-windows -a | fzf-tmux -p -w 100% -h 50% -y S)

if [[ -n $search ]]; then
  session_window=$(echo $search | awk -F ': ' '{print $1}')

  tmux switch-client -t $session_window
fi
