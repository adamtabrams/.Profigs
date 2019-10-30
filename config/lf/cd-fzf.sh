#!/bin/sh

next_dir=$(fd -H -t d -t l -E ".git" | fzf)

if [ "$next_dir" ]; then
    echo "$next_dir"
fi
