#!/bin/bash

STACK_NAME="ecs-auto-scaling-group-stack"
TEMPLATE_FILE="ec2-autoscaling/auto-scaling-group.yaml"

echo "🚀 Deploying Auto Scaling Group stack: $STACK_NAME"
aws cloudformation deploy \
  --stack-name $STACK_NAME \
  --template-file $TEMPLATE_FILE \
  --capabilities CAPABILITY_NAMED_IAM

if [ $? -eq 0 ]; then
  echo "✅ Sukses deploy Auto Scaling Group stack."
else
  echo "❌ Gagal deploy Auto Scaling Group stack."
fi
