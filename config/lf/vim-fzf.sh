#!/bin/sh

FILES=$(fzf -m | tr '\n' ' ' | sed 's/ $//')

if [ "$FILES" ]; then
    nvim $FILES
fi
