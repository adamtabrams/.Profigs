venv() {
    if [ "$CUR_VENV" ]; then
        echo "Deactivating $CUR_VENV/env"
        deactivate 2>/dev/null
        export CUR_VENV=""
    fi

    if [ -d ./env ]; then
        echo "Sourcing $PWD/env"
        source ./env/bin/activate
        export CUR_VENV="$PWD"
    fi
}

