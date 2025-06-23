#!/bin/bash
echo "===== START SCRIPT STARTED ====="

IMAGE_URI=123456789012.dkr.ecr.ap-south-1.amazonaws.com/nodejs-ssl-server:latest

# Login and pull image
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $(echo $IMAGE_URI | cut -d/ -f1)
docker pull $IMAGE_URI

# Run the container
docker run -d -p 3000:3000 --name nodejs-app $IMAGE_URI

echo "===== START SCRIPT ENDED ====="
