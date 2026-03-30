#!/bin/bash

# 1. Get the current Git Hash
GIT_HASH=$(git rev-parse --short HEAD)
REPO="portiad/abs-opds"

echo "🚀 Building version: $GIT_HASH for QNAP (AMD64)..."

# 2. Build and Push
docker buildx build \
  --platform linux/amd64 \
  -t $REPO:$GIT_HASH \
  -t $REPO:latest \
  --push .

echo "✅ Successfully pushed $REPO:$GIT_HASH to Docker Hub."
