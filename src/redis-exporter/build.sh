#!/bin/bash

set -e

VERSION='1.52.0'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    rm -Rf tmp/
    mkdir -p tmp/

    wget -q https://github.com/oliver006/redis_exporter/releases/download/v${VERSION}/redis_exporter-v${VERSION}.linux-${ARCH}.tar.gz
    tar --strip-components 1 -xvf redis_exporter-v${VERSION}.linux-${ARCH}.tar.gz -C tmp/

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
