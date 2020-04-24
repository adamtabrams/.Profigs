# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks

export MARKFILE="$HOME/.local/share/lf/marks"

marks() {
    cat "$MARKFILE" | tr ':' ' '

}

jump() {
    new_dir=$(marks | fzf --reverse | cut -f 2 -d ' ')
    [ "$new_dir" ] && cd "$new_dir"
}

mark() {
    [[ $# != 1 ]] &&
        echo "Must be 1 char" &&
        return 1

    grep "^${1}:" "$MARKFILE" &&
        echo "Char already assigned" &&
        return 1

    echo "${1}:$PWD" >> "$MARKFILE"
}

unmark() {
    [[ $(uname -s) == Darwin ]] &&
        sed -i '' -e "/^${1}:/d" "$MARKFILE" &&
        return 0

    sed -i "/^${1}:/d" "$MARKFILE"
}
