#!/bin/sh

next_dir=$($FZF_ALT_C_COMMAND | fzf)
[ "$next_dir" ] && echo "$next_dir"
