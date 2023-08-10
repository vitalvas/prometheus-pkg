#!/bin/bash

grep -q prometheus /etc/group || groupadd --system prometheus
grep -q prometheus /etc/shadow || useradd -s /sbin/nologin --system --home-dir /var/lib/prometheus -g prometheus prometheus
