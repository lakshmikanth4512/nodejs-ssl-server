#!/bin/bash
echo "===== INSTALL SCRIPT STARTED ====="

# Install Docker if not present
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing..."
    sudo yum update -y
    sudo yum install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo usermod -aG docker ec2-user
else
    echo "Docker is already installed. Restarting Docker..."
    sudo systemctl restart docker
fi

# Verify Docker is running
if systemctl is-active --quiet docker; then
    echo "Docker is running."
else
    echo "Docker failed to start!" >&2
    exit 1
fi

echo "===== INSTALL SCRIPT ENDED ====="
