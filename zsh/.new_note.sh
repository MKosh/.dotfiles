#!/bin/bash

if [[ ! -d $HOME/notes/src ]]; then
  mkdir -p $HOME/notes/src
fi

note_file_name="$HOME/notes/src/note-$(date +%Y-%m-%d).md"

if [[ ! -f $note_file_name ]]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $note_file_name
fi

wezterm start --always-new-process -- \
nvim -c "norm Go" \
     -c "norm Go## $(date +%H:%M)" \
     -c "norm G2o" \
     -c "norm zz" \
     -c "startinsert" $note_file_name
