#!/bin/sh

[ ! "$HISTFILE" ] && echo "No HISTFILE env var defined" && exit 1

backup="$(dirname "$HISTFILE")/$(basename "$HISTFILE").bak"
last_changed=$(stat -t "%Y%m%d" -qf "%Sc" "$backup")
today=$(date +%Y%m%d)
touch "$backup"
histfile_ln=$(wc -l < "$HISTFILE")
backup_ln=$(wc -l < "$backup")

warn() {
    echo "History file lines: $histfile_ln"
    echo "Backup file lines: $backup_ln"
    echo "Aborting backup to avoid losing any history"
}

fix() {
    echo "Would you like restore history from backup? (y/n)"
    read -r answer
    [ "$answer" = "y" ] &&
        cat "$HISTFILE" >> "$backup" &&
        cp "$backup" "$HISTFILE"
}

[ "$last_changed" != "$today" ] &&
    [ "$histfile_ln" -gt "$backup_ln" ] &&
    cp "$HISTFILE" "$backup" && exit 0

[ "$histfile_ln" -lt "$backup_ln" ] &&
    warn && fix
