#!/bin/sh

bat \
    --color=always \
    --theme="base16" \
    --paging=never \
    --line-range=":$2" \
    "$1"

