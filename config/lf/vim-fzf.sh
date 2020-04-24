#!/bin/sh

files=$(fzf -m | tr '\n' ' ')
[ "$files" ] && "$EDITOR" $files
