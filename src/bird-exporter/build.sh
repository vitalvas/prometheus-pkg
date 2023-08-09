#!/bin/bash

VERSION='1.4.1'

wget -q https://github.com/czerwonk/bird_exporter/releases/download/${VERSION}/bird_exporter_${VERSION}_linux_amd64.tar.gz
tar --strip-components 1 -xvf bird_exporter_${VERSION}_linux_amd64.tar.gz

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/bird-exporter/g' > postinstall.sh
