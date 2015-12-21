#!/bin/bash
# This file is no longer in use, but is left for historical reasons.
# See solano.yml and ./scripts/solano-docker_build.sh
exit 0

if [[ -z "$DOCKER_EMAIL" || -z "$DOCKER_USER" || -z "$DOCKER_PASSWORD" ]]; then
  echo 'ERROR: The $DOCKER_EMAIL, $DOCKER_USER, and $DOCKER_PASSWORD values are not all set!'
  echo 'Please use `solano config:add repo <key> <value>` to set these values'
  echo 'See: http://docs.solanolabs.com/Setup/setting-environment-variables/#via-config-variables'
  exit 1
fi

sudo docker login --email=$DOCKER_EMAIL --username=$DOCKER_USER --password=$DOCKER_PASSWORD # Not necessary for public docker repostiories 
sudo docker pull ubuntu:14.04
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_SESSION_ID .
