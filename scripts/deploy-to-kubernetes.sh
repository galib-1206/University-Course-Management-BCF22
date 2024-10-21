#!/bin/bash

# Use the environment variables retrieved from Parameter Store
echo "Deploying to Kubernetes namespace: $K8S_NAMESPACE"
echo "Using ECR Repository URL: $ECR_REPOSITORY_URL"
echo "Version: $VERSION"

# Apply the Kubernetes manifest with the updated values
sed "s|#{VERSION}#|$VERSION|g;s|#{REPOSITORY}#|$REPOSITORY|g;s|#{ECR_REPOSITORY_URL}#|$ECR_REPOSITORY_URL|g" \
  $K8S_MANIFEST_FILE | kubectl -n $K8S_NAMESPACE apply -f -
