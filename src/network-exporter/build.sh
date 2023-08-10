#!/bin/bash

set -e

VERSION='1.7.3'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    rm -Rf tmp/
    mkdir -p tmp/

    FILE_ARCH="${ARCH}"
    if [ "${ARCH}" == "amd64" ]; then
        FILE_ARCH="x86_64"
    fi

    wget -q https://github.com/syepes/network_exporter/releases/download/${VERSION}/network_exporter_${VERSION}.Linux_${FILE_ARCH}.tar.gz
    tar -xvf network_exporter_${VERSION}.Linux_${FILE_ARCH}.tar.gz -C tmp/

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
