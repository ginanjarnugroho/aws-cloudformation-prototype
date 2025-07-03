#!/bin/bash

# Nama stack CloudFormation
STACK_NAME=task-definition-stack

# Lokasi file template dan parameter
TEMPLATE_FILE=ecs/task-definition.yaml
PARAMS_FILE=parameters/task-definition-params.json

# Region tempat resource akan dibuat
REGION=ap-southeast-1

# Jalankan perintah deploy menggunakan AWS CLI
aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file $TEMPLATE_FILE \
  --parameter-overrides file://$PARAMS_FILE \
  --capabilities CAPABILITY_NAMED_IAM \
  --region $REGION
