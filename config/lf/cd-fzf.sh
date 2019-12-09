#!/bin/sh

next_dir=$($FZF_ALT_C_COMMAND | fzf)

if [ "$next_dir" ]; then
    echo "$next_dir"
fi
