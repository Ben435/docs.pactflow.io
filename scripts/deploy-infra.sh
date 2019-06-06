#!/bin/bash

set -e

if [ "" = "$1" ]; then
  echo "Usage: "
  echo "  ./deploy-infra.sh environment"
  exit 1
fi

AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-ap-southeast-2}
ENVIRONMENT=$1
STACKNAME=pactflow-docsite-${ENVIRONMENT}-infra
PARAMETER_VAR=${ENVIRONMENT}_PARAMETERS
PARAMETERS=${!PARAMETER_VAR}

ScriptDir=$(dirname $0)

aws cloudformation deploy \
  --stack-name $STACKNAME \
  --template-file $ScriptDir/../templates/infra.yaml \
  --parameter-overrides \
    EnvironmentName=$ENVIRONMENT \
    $PARAMETERS \
  --no-fail-on-empty-changeset \
  --capabilities CAPABILITY_NAMED_IAM \
  --tags $TAGS
