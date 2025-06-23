#!/bin/bash
echo "Starting container..."
IMAGE_URI="845091770108.dkr.ecr.ap-south-1.amazonaws.com/nodejs-ssl-server:latest"
docker pull $IMAGE_URI
docker run -d -p 3000:3000 --name nodejs-app $IMAGE_URI
