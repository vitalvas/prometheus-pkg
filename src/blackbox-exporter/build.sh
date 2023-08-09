#!/bin/bash

VERSION='0.24.0'

wget -q https://github.com/prometheus/blackbox_exporter/releases/download/v${VERSION}/blackbox_exporter-${VERSION}.linux-amd64.tar.gz
tar --strip-components 1 -xvf blackbox_exporter-${VERSION}.linux-amd64.tar.gz

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/blackbox-exporter/g' > postinstall.sh
