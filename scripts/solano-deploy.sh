#!/bin/bash

if [[ "passed" != "$TDDIUM_BUILD_STATUS" ]]; then
  echo "\$TDDIUM_BUILD_STATUS = $TDDIUM_BUILD_STATUS"
  echo "Will only deploy on passed builds"
  exit
fi

if [[ "master" != "$TDDIUM_CURRENT_BRANCH" ]]; then
  echo "\$TDDIUM_CURRENT_BRANCH = $TDDIUM_CURRENT_BRANCH"
  echo "Will only depoloy on master branch"
  exit
fi

if [[ "ci" != "$TDDIUM_MODE" ]]; then
  echo "\$TDDIUM_MODE = $TDDIUM_MODE"
  echo "Will on deploy on ci initiated builds."
  exit
fi

if [ -z "$DEPLOY_TARGET" ]; then
  echo "No \$DEPLOY_TARGET set"
  exit
fi

case $DEPLOY_TARGET in
  docker)
    sudo docker login -e=$DOCKER_EMAIL -u=$DOCKER_USER -p=$DOCKER_PASSWORD
    sudo docker push $DOCKER_USER/$DOCKER_APP
    ;;
  *)
    echo "Unhandled deploy target: $DEPLOY_TARGET"
    exit 1
    ;;
esac
