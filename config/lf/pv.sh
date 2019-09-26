#!/bin/sh

bat \
    --color=always \
    --theme="base16" \
    --paging=never \
    --style="changes" \
    --line-range=":$2" \
    "$1"

