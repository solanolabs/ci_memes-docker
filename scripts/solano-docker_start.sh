#!/bin/bash
# start docker container

set -o errexit -o pipefail # Exit on error
# Start docker container and record ID and IP address
CID=$(sudo docker run -d --expose=80 $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID)
echo $CID > $TDDIUM_REPO_ROOT/container-$TDDIUM_SESSION_ID.cid
IP_ADDR=$(sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CID)
echo $IP_ADDR > $TDDIUM_REPO_ROOT/container-$TDDIUM_SESSION_ID.ip
