#!/bin/bash

set -e -o pipefail

APP=$1

if [ -z "${APP}" ]; then
    echo 'No APP defined'
    exit 1
fi

if [ -f "src/${APP}/build.sh" ]; then
    bash -x src/${APP}/build.sh
fi
