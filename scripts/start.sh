#!/bin/bash
echo "===== START SCRIPT STARTED ====="

IMAGE_URI=845091770108.dkr.ecr.ap-south-1.amazonaws.com/nodejs-ssl-server:latest

# Login to ECR and pull the image
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 845091770108.dkr.ecr.ap-south-1.amazonaws.com
docker pull $IMAGE_URI

# Run the container
docker run -d -p 3000:3000 --name nodejs-app $IMAGE_URI

echo "===== START SCRIPT ENDED ====="
