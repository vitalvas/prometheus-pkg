#!/bin/bash

set -e

NAME=${1}

upload() {
    OSNAME=${1}
    VERSION=${2}
    CHANNEL=${3}
    FILE=${4}

    # upload format ${REPO}/${OSNAME}/${VERSION}/${CHANNEL}/${FILE}
    aws s3 cp ${FILE} s3://repo-upload.vitalvas.dev/prometheus/${OSNAME}/${VERSION}/${CHANNEL}/${FILE}
}

if [ ! -f "./src/${NAME}/build.sh" ]; then
    echo "no build defined"
    exit 1
fi

cd src/${NAME}

cat ../../tools/scripts/preinstall.sh | sed "s/__name__/${NAME}/g" > preinstall.sh
cat ../../tools/scripts/postinstall.sh | sed "s/__name__/${NAME}/g" > postinstall.sh

if [ -d "tmp/" ]; then
    rm -Rf tmp/
    mkdir -p tmp/
fi

export PKG_NAME=${NAME}
bash -x build.sh

for deb_file_name in $(ls *.deb); do
    upload ubuntu focal main ${deb_file_name}
    upload ubuntu jammy main ${deb_file_name}
    upload debian bullseye main ${deb_file_name}
    upload debian bookworm main ${deb_file_name}
done
