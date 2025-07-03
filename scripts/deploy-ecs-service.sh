#!/bin/bash

STACK_NAME=ecs-service-stack
TEMPLATE_FILE=ecs/ecs-service.yaml
PARAMS_FILE=parameters/ecs-service-params.json
REGION=ap-southeast-1

aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file $TEMPLATE_FILE \
  --parameter-overrides file://$PARAMS_FILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION
