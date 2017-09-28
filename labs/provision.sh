# This script installs wagon in a virtualenv - officially tested on Ubuntu 17.04

function install_pip() {
    local pip=$(which pip)

    if ! pip; then
        curl -O https://bootstrap.pypa.io/get-pip.py
        python get-pip.py
    fi
}

function install_virtualenv() {
    local virtualenv=$(which virtualenv)

    if ! virtualenv; then
        pip install virtualenv
    fi
}

function install wagon() {
    local venv="~/wagon"

    virtualenv ${venv}
    . ~/wagon/bin/activate
    pip install wagon

    echo ". ~/wagon/bin/activate" >> "~/.bashrc"
}
