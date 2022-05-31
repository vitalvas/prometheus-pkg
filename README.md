# prometheus-pkg
Prometheus Packages

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
