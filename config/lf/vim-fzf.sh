#!/bin/sh

files=$(fzf -m | tr '\n' ' ' | sed 's/ $//')

if [ "$files" ]; then
    "$EDITOR" $files
fi
