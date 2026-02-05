#!/usr/bin/env bash

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  echo "tmux needs to be running"
  exit 1
fi

if [[ ! -x "$HOME/.local/bin/claude" ]]; then
  echo "claude executable not found in ~/.local/bin"
  exit 1
fi

# tmux split-window -h -p 40 "source ~/.zshrc && claude --ide"
tmux split-window -h -p 40 -c "#{pane_current_path}" "export PATH=$HOME/.local/bin:$PATH && claude --ide"
