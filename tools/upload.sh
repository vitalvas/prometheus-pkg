#!/bin/bash

for NAME in $(ls *.deb); do
    curl --user ${REPO_USER_NAME}:${REPO_USER_PASS} \
        --silent --fail --upload-file ${NAME} \
        --retry 5 --retry-delay 0 --retry-max-time 40 \
        https://${REPO_UPLOAD_ADDR}/prometheus/ubuntu/common/main/${NAME}
done
