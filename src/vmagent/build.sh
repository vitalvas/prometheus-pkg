#!/bin/bash

VERSION='1.92.1'

wget -q https://github.com/VictoriaMetrics/VictoriaMetrics/releases/download/v${VERSION}/vmutils-linux-amd64-v${VERSION}.tar.gz
tar -xvf vmutils-linux-amd64-v${VERSION}.tar.gz 

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/vmagent/g' > postinstall.sh
