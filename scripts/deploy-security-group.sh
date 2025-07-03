#!/bin/bash

# 1. Set nama stack VPC 
VPC_STACK_NAME="vpc-stack"

# 2. Set nama stack untuk Security Group
SG_STACK_NAME="sg-stack"

# 3. IP untuk SSH
MY_IP="123.123.123.123/32"

VPC_ID=$(aws cloudformation describe-stacks \
  --stack-name "$VPC_STACK_NAME" \
  --query "Stacks[0].Outputs[?OutputKey=='VPCId'].OutputValue" \
  --output text)

if [[ -z "$VPC_ID" || "$VPC_ID" == "None" ]]; then
  echo "❌ Gagal mendapatkan VPC ID. Pastikan stack $VPC_STACK_NAME memiliki Outputs bernama 'VPCId'"
  exit 1
fi

aws cloudformation deploy \
  --template-file security-groups/global-security-group.yaml \
  --stack-name "$SG_STACK_NAME" \
  --parameter-overrides VPCID="$VPC_ID" SSHAllowedIP="$MY_IP" \
  --capabilities CAPABILITY_NAMED_IAM

echo "✅ Security Group stack deployed successfully."
