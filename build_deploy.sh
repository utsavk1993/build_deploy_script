#!/bin/bash
# build_deploy.sh
# Compile code, build Docker image, run tests, and deploy

set -e  # Exit immediately if a command fails

# Step 1: Compile C++ project using make and gcc
echo "Compiling project..."
make clean
make all

# Step 2: Build Docker image
echo "Building Docker image..."
DOCKER_IMAGE="myservice:latest"
docker build -t $DOCKER_IMAGE .

# Step 3: Run unit tests inside Docker container
echo "Running tests..."
docker run --rm $DOCKER_IMAGE python3 -m unittest discover tests/

# Step 4: Push Docker image to registry (optional)
# docker tag $DOCKER_IMAGE myregistry/myservice:latest
# docker push myregistry/myservice:latest

# Step 5: Deploy container to server
echo "Deploying container..."
docker stop myservice || true
docker rm myservice || true
docker run -d --name myservice -p 8000:8000 $DOCKER_IMAGE

# Step 6: Tag Git branch for deployment
echo "Tagging deployment in Git..."
git add .
git commit -m "Deployment: $(date +%F_%T)"
git tag -a "deploy-$(date +%F-%H%M)" -m "Automated deployment"
git push --follow-tags

echo "Deployment complete!"
