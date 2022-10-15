#!/bin/bash -ex

STACK_NAME=${1:-dev-env}
REGION=${2:-eu-central-1}
PROFILE=${3:-default}

deploy () {

  local CMD="aws cloudformation --region=${REGION} --profile=${PROFILE}"

  ${CMD} deploy \
  --stack-name ${STACK_NAME} \
  --template-file ./aws/ec2.yml \
  --parameter-overrides $(cat ./aws/overrides.ini) \
  --capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM CAPABILITY_AUTO_EXPAND

}

deploy
