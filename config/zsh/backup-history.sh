#!/bin/sh

hist_dir="$(dirname "$HISTFILE")"

if [ -f "$hist_dir/histfile.bak.info" ]; then
    [ "$(date +%Y%m%d)" = "$(cat "$hist_dir"/histfile.bak.info)" ] && exit 0

    histfile_ln="$(wc -l < "$HISTFILE")"
    bakfile_ln="$(wc -l < "$hist_dir"/histfile.bak)"

    if [ "$histfile_ln" -lt "$bakfile_ln" ]; then
        echo "History file lines: $histfile_ln"
        echo "Backup file lines: $bakfile_ln"
        echo "Aborting backup to avoid losing any history"
        exit 0
    fi
fi

cp "$HISTFILE" "$hist_dir/histfile.bak"
date +%Y%m%d > "$hist_dir/histfile.bak.info"


