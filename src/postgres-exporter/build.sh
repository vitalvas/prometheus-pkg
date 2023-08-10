#!/bin/bash

set -e

VERSION='0.13.2'
ARCHS=(amd64 arm64)

for ARCH in ${ARCHS[@]}; do
    rm -Rf tmp/
    mkdir -p tmp/

    wget -q https://github.com/prometheus-community/postgres_exporter/releases/download/v${VERSION}/postgres_exporter-${VERSION}.linux-${ARCH}.tar.gz
    tar --strip-components 1 -xvf postgres_exporter-${VERSION}.linux-${ARCH}.tar.gz

    env PKG_ARCH=${ARCH} PKG_VERSION=${VERSION} nfpm pkg --packager deb -f nfpm.yaml
done
