#!/bin/bash

VERSION='1.92.1'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    rm -Rf tmp/
    mkdir -p tmp/

    wget -q https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${VERSION}/vmutils-linux-${ARCH}-v${VERSION}.tar.gz
    tar -xvf vmutils-linux-${ARCH}-v${VERSION}.tar.gz -C tmp/

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
