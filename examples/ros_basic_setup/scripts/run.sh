#!/bin/bash

set -xe

docker build --tag learning_machines .
# Mounting to a directory that does not exist creates it.
# Mounting to relative paths works since docker engine 23
docker run -t --rm -p 45100:45100 -p 45101:45101 -v ./results:/root/results learning_machines "$@"

# Because docker runs as root, this means the files will be owned by the root user.
# Change this with:
# sudo chown "$USER":"$USER" ./results -R
