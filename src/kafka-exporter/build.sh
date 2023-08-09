#!/bin/bash

VERSION='1.7.0'

wget -q https://github.com/danielqsj/kafka_exporter/releases/download/v${VERSION}/kafka_exporter-${VERSION}.linux-amd64.tar.gz
tar --strip-components 1 -xvf kafka_exporter-${VERSION}.linux-amd64.tar.gz

cat ../../tools/scripts/postinstall.sh | sed 's/__name__/kafka-exporter/g' > postinstall.sh
