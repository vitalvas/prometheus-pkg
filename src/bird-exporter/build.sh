#!/bin/bash

set -e

VERSION='1.4.1'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    rm -Rf tmp/
    mkdir -p tmp/

    wget -q https://github.com/czerwonk/bird_exporter/releases/download/${VERSION}/bird_exporter_${VERSION}_linux_${ARCH}.tar.gz
    tar -xvf bird_exporter_${VERSION}_linux_${ARCH}.tar.gz -C tmp/

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
