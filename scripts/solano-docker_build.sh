#!/bin/bash
# Build

set -o errexit -o pipefail # Exit on error
sudo docker pull ubuntu:14.04
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID .
