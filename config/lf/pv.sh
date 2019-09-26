#!/bin/sh

bat \
    --theme="base16" \
    --paging=never \
    --style="changes" \
    --line-range=":$2" \
    "$1"

