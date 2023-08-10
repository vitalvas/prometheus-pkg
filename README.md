# Prometheus Packages

[![Build](https://github.com/vitalvas/prometheus-pkg/actions/workflows/build.yaml/badge.svg)](https://github.com/vitalvas/prometheus-pkg)

## Install

Install dependencies

```shell
apt install -qy apt-transport-https
```

Add new repo:

```shell
mkdir /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/vitalvas-prometheus-ubuntu.gpg https://repo.vitalvas.com/prometheus/ubuntu/sign-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/vitalvas-prometheus-ubuntu.gpg] https://repo.vitalvas.com/prometheus/ubuntu common main" | tee /etc/apt/sources.list.d/vitalvas-prometheus.list

cat <<EOF>/etc/apt/preferences.d/vitalvas-prometheus
Package: prometheus-*
Pin: origin repo.vitalvas.com
Pin-Priority: 1010
EOF

apt update -qy
```

## Packages

| Package name | Description |
| - | - |
| pp-prometheus-bird-exporter | Exporter for Bird routing daemon |
| pp-prometheus-blackbox-exporter | Blackbox exporter |
| pp-prometheus-kafka-exporter | Kafka exporter |
| pp-prometheus-network-exporter | Network exporter |
| pp-prometheus-node-exporter | Node exporter |
| pp-prometheus-postgres-exporter | PostgreSQL exporter |
| pp-prometheus-redis-exporter | Redis exporter |
| pp-prometheus-vmagent | VictoriaMetrics Agent |
