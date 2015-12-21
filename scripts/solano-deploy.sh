#!/bin/bash

# Exit on script errors
set -o errexit -o pipefail

# Only deploy if all tests have passed
if [[ "passed" != "$TDDIUM_BUILD_STATUS" ]]; then
  echo "\$TDDIUM_BUILD_STATUS = $TDDIUM_BUILD_STATUS"
  echo "Will only deploy on passed builds"
  exit
fi

# Only the master branch should trigger deploys
if [[ "master" != "$TDDIUM_CURRENT_BRANCH" ]]; then
  echo "\$TDDIUM_CURRENT_BRANCH = $TDDIUM_CURRENT_BRANCH"
  echo "Will only depoloy on master branch"
  exit
fi

# Uncomment if cli-initiated Solano builds should not trigger deploys
#if [[ "ci" != "$TDDIUM_MODE" ]]; then
#  echo "\$TDDIUM_MODE = $TDDIUM_MODE"
#  echo "Will on deploy on ci initiated builds."
#  exit
#fi

# Deploy to docker hub?
if [ -z "$DEPLOY_DOCKER" ] && [[ "true" == "$DEPLOY_DOCKER" ]]; then
  echo "Will only deploy if \$DEPLOY_DOCKER is set."
  exit
fi
sudo docker login --email=$DOCKER_EMAIL --username=$DOCKER_USER --password=$DOCKER_PASSWORD
sudo docker push $DOCKER_USER/$DOCKER_APP

# Deploy to AWS EC2 Container Service?
if [ -n "$DEPLOY_AWS_ECS" ] && [[ "true" == "$DEPLOY_AWS_ECS" ]]; then

  # Ensure required environment variables are set
  if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ] || [ -z "$AWS_DEFAULT_REGION" ]; then
    echo "AWS ECS deploy requires setting \$AWS_ACCESS_KEY_ID, \$AWS_SECRET_ACCESS_KEY, and \$AWS_DEFAULT_REGION"
    echo 'See: http://docs.solanolabs.com/Setup/setting-environment-variables/#via-config-variables'
    exit 1
  fi

  # Ensure aws-cli is installed and configured
  if [ ! -f $HOME/bin/aws ]; then
    curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
    unzip awscli-bundle.zip
    ./awscli-bundle/install -b $HOME/bin/aws
  fi
  if [ -d $HOME/lib/python2.7/site-packages ]; then
    export PYTHONPATH=$HOME/lib/python2.7/site-packages
  fi

  # Create new task definition from template file
  sed -e "s;%TDDIUM_SESSION_ID%;$TDDIUM_SESSION_ID;g" ci_memes.json \
    | sed -e "s;%AWS_ECS_TASK_DEFINITION%;$AWS_ECS_TASK_DEFINITION;g" \
    | sed -e "s;%DOCKER_USER%;$DOCKER_USER;g" \
    | sed -e "s;%DOCKER_APP%;$DOCKER_APP;g" \
    > ci_memes-${TDDIUM_SESSION_ID}.json
  aws ecs register-task-definition --family $AWS_ECS_TASK_DEFINITION --cli-input-json file://ci_memes-${TDDIUM_SESSION_ID}.json

  # Get revision number of newly created definition
  REV=`aws ecs describe-task-definition --task-definition $AWS_ECS_TASK_DEFINITION | egrep "revision" | tr "/" " " | awk '{print $2}' | sed 's/"$//'`

  # Update
  aws ecs update-service --cluster $AWS_ECS_CLUSTER --service $AWS_ECS_SERVICE --task-definition ${AWS_ECS_TASK_DEFINITION}:${REV}
  
fi
