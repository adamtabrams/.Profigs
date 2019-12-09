venv() {
    if [[ $VIRTUAL_ENV ]]; then
        echo "Deactivating $VIRTUAL_ENV/venv"
        deactivate 2>/dev/null
    fi

    if [[ -d ./venv ]]; then
        echo "Sourcing $PWD/venv"
        source ./venv/bin/activate
    fi
}

