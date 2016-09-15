#!/bin/bash

# Exit on script errors
set -o errexit -o pipefail
set -x

# Only deploy if all tests have passed
if [[ "passed" != "$TDDIUM_BUILD_STATUS" ]]; then
  echo "\$TDDIUM_BUILD_STATUS = $TDDIUM_BUILD_STATUS"
  echo "Will only deploy on passed builds"
  exit
fi

# Only the master branch should trigger deploys
#if [[ "master" != "$TDDIUM_CURRENT_BRANCH" ]]; then
#  echo "\$TDDIUM_CURRENT_BRANCH = $TDDIUM_CURRENT_BRANCH"
#  echo "Will only depoloy on master branch"
#  exit
#fi

# Uncomment if cli-initiated Solano builds should not trigger deploys
#if [[ "ci" != "$TDDIUM_MODE" ]]; then
#  echo "\$TDDIUM_MODE = $TDDIUM_MODE"
#  echo "Will on deploy on ci initiated builds."
#  exit
#fi

# Deploy to Google Container Registry
if [ -n "$DEPLOY_GCR" ] && [[ "true" == "$DEPLOY_GCR" ]]; then
  sudo docker tag $GCR_DOCKER_USER/$GCR_DOCKER_APP $GCR_DOMAIN/$GCR_PROJECT_ID/$GCR_DOCKER_APP:$TDDIUM_SESSION_ID
  sudo gcloud docker push $GCR_DOMAIN/$GCR_PROJECT_ID/$GCR_DOCKER_APP:$TDDIUM_SESSION_ID

  # Deploy to latest tag for pull on next ci build
  #sudo docker tag -f $GCR_DOCKER_USER/$GCR_DOCKER_APP $GCR_DOMAIN/$GCR_PROJECT_ID/$GCR_DOCKER_APP:latest 
  #sudo gcloud docker push $GCR_DOMAIN/$GCR_PROJECT_ID/$GCR_DOCKER_APP:latest
fi
