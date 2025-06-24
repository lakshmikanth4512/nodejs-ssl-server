#!/bin/bash
echo "===== INSTALL SCRIPT STARTED ====="

# Install Docker if not present
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing..."
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ec2-user
    echo "Docker installed."
else
    echo "Docker already installed."
fi

# Log in to Amazon ECR
aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin 845091770108.dkr.ecr.ap-south-1.amazonaws.com

# Pull image from ECR
IMAGE_URI=845091770108.dkr.ecr.ap-south-1.amazonaws.com/nodejs-ssl-server:latest
echo "Pulling image $IMAGE_URI"
docker pull $IMAGE_URI

# Stop and remove existing containers (if any)
docker stop $(docker ps -q) 2>/dev/null || true
docker rm $(docker ps -a -q) 2>/dev/null || true

# Run new container on port 8080
docker run -d -p 8080:3000 $IMAGE_URI

echo "===== INSTALL SCRIPT COMPLETED ====="
