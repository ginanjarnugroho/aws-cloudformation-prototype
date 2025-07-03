#!/bin/bash

set -e  # Stop kalau ada error

echo "⚠️  Mulai menghapus semua stack AWS (urutan terbalik)..."

# 1. Hapus ECS Service
echo "🗑️ Menghapus ECS Service Stack..."
aws cloudformation delete-stack --stack-name ecs-service-stack
aws cloudformation wait stack-delete-complete --stack-name ecs-service-stack

# 2. Hapus Auto Scaling Group
echo "🗑️ Menghapus Auto Scaling Group Stack..."
aws cloudformation delete-stack --stack-name auto-scaling-group-stack
aws cloudformation wait stack-delete-complete --stack-name auto-scaling-group-stack

# 3. Hapus Launch Template
echo "🗑️ Menghapus Launch Template Stack..."
aws cloudformation delete-stack --stack-name ecs-launch-template-stack
aws cloudformation wait stack-delete-complete --stack-name ecs-launch-template-stack

# 4. Hapus Task Definition
echo "🗑️ Menghapus Task Definition Stack..."
aws cloudformation delete-stack --stack-name task-definition-stack
aws cloudformation wait stack-delete-complete --stack-name task-definition-stack

# 5. Hapus ECS Cluster
echo "🗑️ Menghapus ECS Cluster Stack..."
aws cloudformation delete-stack --stack-name ecs-cluster-stack
aws cloudformation wait stack-delete-complete --stack-name ecs-cluster-stack

# 6. Hapus Security Group
echo "🗑️ Menghapus Security Group Stack..."
aws cloudformation delete-stack --stack-name security-group-stack
aws cloudformation wait stack-delete-complete --stack-name security-group-stack

# 7. Hapus VPC
echo "🗑️ Menghapus VPC Stack..."
aws cloudformation delete-stack --stack-name vpc-stack
aws cloudformation wait stack-delete-complete --stack-name vpc-stack

echo "✅ Semua stack berhasil dihapus."
