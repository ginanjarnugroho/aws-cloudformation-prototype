#!/bin/bash

set -e  # Stop kalau ada error

echo "🚀 Mulai Deploy Semua Stack AWS..."

# 0. Deploy IAM
echo "📦 Deploying VPC..."
./scripts/deploy-iam-role.sh

# 1. Deploy VPC
echo "📦 Deploying VPC..."
./scripts/deploy-vpc.sh

# 2. Deploy Security Group
echo "🔒 Deploying Global Security Group..."
./scripts/deploy-security-group.sh

# 3. Deploy ECS Cluster
echo "🛠️ Deploying ECS Cluster..."
./scripts/deploy-ecs-cluster.sh

# 4. Deploy Task Definition
echo "📦 Deploying ECS Task Definition..."
./scripts/deploy-task-definition.sh

# 5. Deploy Launch Template
echo "📄 Deploying Launch Template..."
./scripts/deploy-launch-template.sh

# 6. Deploy Auto Scaling Group
echo "📈 Deploying Auto Scaling Group..."
./scripts/deploy-auto-scaling-group.sh

# 7. Deploy ECS Service
echo "⚙️ Deploying ECS Service..."
./scripts/deploy-ecs-service.sh

echo "✅ Semua stack berhasil dideploy!"
