# prometheus-pkg
Prometheus Packages

## Install

Install dependencies

```shell
apt install -qy apt-transport-https
```

Add new repo:

```shell
echo "deb [trusted=yes] https://repo.vitalvas.com/prometheus/deb main/" | tee /etc/apt/sources.list.d/vitalvas-prometheus.list
echo -e "Package: *\nPin: origin repo.vitalvas.com\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99repo-vitalvas-com
apt update -qy
```
