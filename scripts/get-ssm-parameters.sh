#!/bin/bash

DEFAULT_AWS_REGION="ap-south-1"

export AWS_REGION=$(aws ssm get-parameter --name "/buet/hackathon/aws-region" --with-decryption --query "Parameter.Value" --output text --region $DEFAULT_AWS_REGION)

export AWS_ACCESS_KEY=$(aws ssm get-parameter --name "/buet/hackathon/aws-access-key" --with-decryption --query "Parameter.Value" --output text --region $AWS_REGION)
export AWS_SECRET_KEY=$(aws ssm get-parameter --name "/buet/hackathon/aws-secret-key" --with-decryption --query "Parameter.Value" --output text --region $AWS_REGION)

export ECR_REPOSITORY_URL=$(aws ssm get-parameter --name "/buet/hackathon/ecr-repo-url" --with-decryption --query "Parameter.Value" --output text --region $AWS_REGION)

export K8S_NAMESPACE=$(aws ssm get-parameter --name "/buet/hackathon/k8s-namespace" --with-decryption --query "Parameter.Value" --output text --region $AWS_REGION)

export VERSION=$(aws ssm get-parameter --name "/buet/hackathon/version" --with-decryption --query "Parameter.Value" --output text --region $AWS_REGION)

echo "export AWS_REGION=$AWS_REGION" >> /etc/environment
echo "export AWS_ACCESS_KEY=$AWS_ACCESS_KEY" >> /etc/environment
echo "export AWS_SECRET_KEY=$AWS_SECRET_KEY" >> /etc/environment
echo "export ECR_REPOSITORY_URL=$ECR_REPOSITORY_URL" >> /etc/environment
echo "export K8S_NAMESPACE=$K8S_NAMESPACE" >> /etc/environment
echo "export VERSION=$VERSION" >> /etc/environment
