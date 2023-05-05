#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

search=$({ echo "${HOME}/.dotfiles"; find $HOME/Workspace -maxdepth 2 -type d -print 2> /dev/null; } | fzf-tmux -p)

if [[ -n $search ]]; then
  folder=$(basename $search | sed "s/\./_/g")
  session=$(tmux list-sessions | grep $folder | awk -F ':' '{print $1}')

  if [[ -z $session ]]; then
    tmux new-session -d -s $folder -c $search
    tmux switch-client -t $folder
  else
    tmux switch-client -t $session
  fi
fi
