#!/bin/bash

if command -V systemctl >/dev/null 2>&1; then
    systemctl daemon-reload ||:
    systemctl unmask __name__ ||:
    systemctl preset __name__ ||:
    systemctl enable __name__ ||:
    systemctl restart __name__ ||:
fi
