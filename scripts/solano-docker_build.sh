#!/bin/bash
# Build and start docker container

set -o errexit -o pipefail # Exit on error

# Ensure docker login credentials are set
if [[ -z "$DOCKER_EMAIL" || -z "$DOCKER_USER" || -z "$DOCKER_PASSWORD" ]]; then
  echo 'ERROR: The $DOCKER_EMAIL, $DOCKER_USER, and $DOCKER_PASSWORD values are not all set!'
  echo 'Please use `solano config:add repo <key> <value>` to set these values'
  echo 'See: http://docs.solanolabs.com/Setup/setting-environment-variables/#via-config-variables'
  exit 1
fi

# Build docker image
sudo docker login --email=$DOCKER_EMAIL --username=$DOCKER_USER --password=$DOCKER_PASSWORD # Not necessary for public docker repostiories 
sudo docker pull ubuntu:14.04
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID .

# Start docker container and record ID and IP address
CID=$(sudo docker run -d --expose=80 $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID)
echo $CID > $TDDIUM_REPO_ROOT/container-$TDDIUM_SESSION_ID.cid
IP_ADDR=$(sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $CID)
echo $IP_ADDR > $TDDIUM_REPO_ROOT/container-$TDDIUM_SESSION_ID.ip
