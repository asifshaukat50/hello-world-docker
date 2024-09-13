#!/bin/bash

# Set variables
IMAGE_NAME="asifshaukat50/hello-world"
TAG="latest"
DOCKERFILE_DIR="."

# Ensure the script fails on any error
set -e

echo "Building Docker image..."
docker build -t $IMAGE_NAME:$TAG $DOCKERFILE_DIR

echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE_NAME:$TAG

echo "Build and push completed successfully."