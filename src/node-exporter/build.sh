#!/bin/bash

VERSION='1.3.1'

wget -q https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz
tar --strip-components 1 -xvf node_exporter-${VERSION}.linux-amd64.tar.gz

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/node-exporter/g' > postinstall.sh
