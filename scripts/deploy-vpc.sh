#!/bin/bash

STACK_NAME=vpc-stack
TEMPLATE_FILE=templates/vpc.yaml
PARAMS_FILE=parameters/vpc-params.json
REGION=ap-southeast-1

aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file $TEMPLATE_FILE \
  --parameter-overrides file://$PARAMS_FILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION
