#!/bin/bash

if [[ -z "$DOCKER_EMAIL" || -z "$DOCKER_USER" || -z "$DOCKER_PASSWORD" ]]; then
  echo 'ERROR: The $DOCKER_EMAIL, $DOCKER_USER, and $DOCKER_PASSWORD values are not all set!'
  echo 'Please use `solano config:add repo <key> <value>` to set these values'
  echo 'See: http://docs.solanolabs.com/Setup/setting-environment-variables/#via-config-variables'
  exit 1
fi

DOCKER_TAG=$TDDIUM_CURRENT_COMMIT

sudo docker login -e=$DOCKER_EMAIL -u=$DOCKER_USER -p=$DOCKER_PASSWORD # Not necessary for public docker repostiories 
sudo docker pull ubuntu:14.04
sudo docker build -t $DOCKER_USER/$DOCKER_APP:$TDDIUM_CURRENT_COMMIT .


