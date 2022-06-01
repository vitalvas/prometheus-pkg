#!/bin/bash

VERSION='0.10.1'

wget -q https://github.com/prometheus-community/postgres_exporter/releases/download/v${VERSION}/postgres_exporter-${VERSION}.linux-amd64.tar.gz
tar --strip-components 1 -xvf postgres_exporter-${VERSION}.linux-amd64.tar.gz

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/postgres-exporter/g' > postinstall.sh
