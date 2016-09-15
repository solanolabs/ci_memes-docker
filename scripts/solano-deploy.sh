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

# Deploy to AWS EC2 Container Service?
if [ -n "$DEPLOY_GCE" ] && [[ "true" == "$DEPLOY_GCE" ]]; then

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
fi
