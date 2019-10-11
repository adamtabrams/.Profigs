# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks

export MARKFILE=$HOME/.local/share/lf/marks

jump() {
    if [ $(echo $1 | head -c 1) == ~ ]; then cd "$1"
    elif [ $(echo $1 | head -c 2) == // ]; then cd $(echo "$1" | sed "s:\/\/:$HOME\/:")
    elif [ $(echo $1 | head -c 1) == / ]; then cd "$1"; fi

    MARKPATH=$(grep --color=never "^$1:" "$MARKFILE")
    MARKPATH=${MARKPATH:2}
    cd "$MARKPATH" 2>/dev/null || {echo "No such mark: $1"; return 1}
}

mark() {
    if [ ${#1} != 1 ]; then
        echo "Must be 1 char"
        return 1
    fi

    if grep "^$1:" "$MARKFILE"; then
        echo "Char already assigned"
        return 1
    fi

    PWD=$(pwd)
    echo "$1:$PWD" >> "$MARKFILE"
}

unmark() {
    sed -i '' -e "/^$1:/d" "$MARKFILE"
}

marks() {
    cat "$MARKFILE" | tr ':' ' '
}

