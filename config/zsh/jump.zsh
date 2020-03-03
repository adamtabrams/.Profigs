# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks

export MARKFILE="$HOME/.local/share/lf/marks"

marks() {
    cat "$MARKFILE" | tr ':' ' '
}

jump() {
    if [[ $(echo $1 | head -c 2) == // ]]; then
        cd $(echo "$1" | sed "s|//|$HOME/|")
        return 0
    elif [[ $(echo $1 | head -c 1) == ~ ]]; then
        cd "$1"
        return 0
    elif [[ $(echo $1 | head -c 1) == / ]]; then
        cd "$1"
        return 0
    elif [[ $(echo $1 | head -c 1) == . ]]; then
        cd "$1"
        return 0
    elif [[ $(echo -n $1 | wc -c) -gt 1 ]]; then
        cd "$1"
        return 0
    elif [[ $(echo -n $1 | wc -c) -lt 1 ]]; then
        return 0
    fi

    markline=$(grep --color=never "^${1}:" "$MARKFILE")
    markpath=${markline:2}

    if [[ $markpath ]]; then
        cd "$markpath"
    else
        echo "No such mark: $1"
        marks
    fi
}

mark() {
    if [[ $# != 1 ]]; then
        echo "Must be 1 char"
        return 1
    fi

    if grep "^${1}:" "$MARKFILE"; then
        echo "Char already assigned"
        return 1
    fi
    echo "${1}:$PWD" >> "$MARKFILE"
}

unmark() {
    if [[ $(uname -s) == Darwin ]]; then
        sed -i '' -e "/^${1}:/d" "$MARKFILE"
    else
        sed -i "/^${1}:/d" "$MARKFILE"
    fi
}
