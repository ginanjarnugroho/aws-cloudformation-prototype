#!/bin/bash

STACK_NAME="iam-ecs-instance-role-stack"
TEMPLATE_FILE="iam/ecs-instance-role.yaml"

echo "🚀 Deploying IAM role stack: $STACK_NAME"

aws cloudformation deploy \
  --template-file $TEMPLATE_FILE \
  --stack-name $STACK_NAME \
  --capabilities CAPABILITY_NAMED_IAM

if [ $? -eq 0 ]; then
  echo "✅ IAM Role dan Instance Profile berhasil dibuat."
else
  echo "❌ Gagal deploy IAM Role."
fi
