#!/bin/bash

set -e -o pipefail

APP=$1

SRC="src/${APP}"


if [ -z "${APP}" ]; then
    echo 'No APP defined'
    exit 1
fi

[ -f "${SRC}/nfpm.yaml" ] && {
    nfpm pkg --packager deb -f ${SRC}/nfpm.yaml
}

ls -lah .

for pkgfullname in $(ls *.deb); do
    pkgname=$(echo ${pkgfullname} | awk -F'_' '{print $1}')
    curl --silent --fail --upload-file ${pkgfullname} https://craft.vitalvas.com/upload/repo/deb/prometheus/${pkgname}/${pkgfullname}
done
