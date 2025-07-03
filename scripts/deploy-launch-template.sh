#!/bin/bash

STACK_NAME="ecs-launch-template-stack"
TEMPLATE_FILE="ec2-autoscaling/launch-template.yaml"
PARAMS_FILE="parameters/launch-template.params.json"

echo "🚀 Deploying ECS Launch Template stack: $STACK_NAME"

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --parameter-overrides file://$PARAMS_FILE \
  --capabilities CAPABILITY_NAMED_IAM

if [ $? -eq 0 ]; then
  echo "✅ Launch Template berhasil dibuat."
else
  echo "❌ Gagal membuat Launch Template."
fi
