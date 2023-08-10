#!/bin/bash

VERSION='1.7.3'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    FILE_ARCH="${ARCH}"
    if [ "${ARCH}" == "amd64" ]; then
        FILE_ARCH="x86_64"
    fi

    wget -q https://github.com/syepes/network_exporter/releases/download/${VERSION}/network_exporter-${VERSION}.Linux-${FILE_ARCH}.tar.gz
    tar --strip-components 1 -xvf network_exporter-${VERSION}.Linux-${FILE_ARCH}.tar.gz -C tmp/

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
