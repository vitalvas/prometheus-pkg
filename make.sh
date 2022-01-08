#!/bin/bash

set -e -o pipefail

APP=$1

SRC="src/${APP}"

function install_nfpm {
    echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | sudo tee /etc/apt/sources.list.d/goreleaser.list
    sudo apt update
    sudo apt install -qy nfpm
}

if [ -z "${APP}" ]; then
    echo 'No APP defined'
    exit 1
fi

[ -f "${SRC}/build.sh" ] && {
    bash -x ${SRC}/build.sh
}

[ -f "${SRC}/nfpm.yaml" ] && {
    install_nfpm
    cd ${SRC}

    nfpm pkg --packager deb 
}

ls -lah .
