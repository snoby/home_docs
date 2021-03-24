#!/bin/bash
set -xe
source version.env
docker build   . --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" -t "${CONTAINER_NAME_LATEST}"
