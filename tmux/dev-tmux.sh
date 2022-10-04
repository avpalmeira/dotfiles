#!/bin/sh
tmux new-session -s dev -n ide \; \
  split-window -v -p 25 -t dev \; \
  split-window -h -p 25 -t dev \; \
  new-window -n shell \; \
  split-window -v -p 50 -t dev:2 \; \
  select-window -t dev:1 \; \
  select-pane -t 3 \; \
  clock-mode \; \
  select-pane -t 1 \; \
  send-keys "$1" C-m \;
