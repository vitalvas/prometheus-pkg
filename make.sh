#!/bin/bash

set -e -o pipefail

APP=$1

SRC="src/${APP}"

function install_nfpm {
    echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' | tee /etc/apt/sources.list.d/goreleaser.list
    apt update
    apt install -qy nfpm
}

if [ -z "${APP}" ]; then
    echo 'No APP defined'
    exit 1
fi

[ -f "${SRC}/build.sh" ] || {
    bash -x src/${APP}/build.sh
}

[ -f "${SRC}/nfpm.yaml" ] || {
    install_nfpm
    nfpm pkg --packager deb 
}

ls -lah .
