#!/bin/bash

git clone https://github.com/MindFlavor/prometheus_wireguard_exporter.git
cd prometheus_wireguard_exporter

cargo install --path .

ls -lah prometheus_wireguard_exporter
