#!/bin/bash

# Exit on script errors
set -o errexit -o pipefail # Exit on error
set -x

if [[ -z "$GCR_PROJECT_ID" || -z "$GCR_SERVICE_ACCOUNT_EMAIL" || -z "$GCR_SERVICE_ACCOUNT_JSON" ]]; then
  echo 'ERROR: The $GCR_PROJECT_ID, $GCR_SERVICE_ACCOUNT_EMAIL, and $GCR_SERVICE_ACCOUNT_JSON values are not all set!'
  echo 'Please use `solano config:add repo <key> <value>` to set these values'
  echo 'See: http://docs.solanolabs.com/Setup/setting-environment-variables/#via-config-variables'
  exit 1
fi

## INSTALL GCLOUD CLI
# Create an environment variable for the correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"

# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

# Import the Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Update and install the Cloud SDK
sudo apt-get update && sudo apt-get -y -f install && sudo apt-get install google-cloud-sdk

# Login using service account credentials
echo $GCR_SERVICE_ACCOUNT_JSON > $TDDIUM_REPO_ROOT/service_account.json
sudo gcloud auth activate-service-account $GCR_SERVICE_ACCOUNT_EMAIL --key-file $TDDIUM_REPO_ROOT/service_account.json

# Pull latest tag from GCR, edit the $GCR_DOCKER_TAG variable if you want to pull a specific tag
sudo gcloud docker pull $GCR_DOMAIN/$GCR_PROJECT_ID/$GCR_DOCKER_APP:$GCR_DOCKER_TAG
sudo docker build -t $GCR_DOCKER_USER/$GCR_DOCKER_APP:$GCR_DOCKER_TAG .
