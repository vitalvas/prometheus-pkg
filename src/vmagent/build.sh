#!/bin/bash

VERSION='1.77.2'

wget -q https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${VERSION}/vmutils-amd64-v${VERSION}.tar.gz
tar -xvf vmutils-amd64-v${VERSION}.tar.gz 

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/vmagent/g' > postinstall.sh
