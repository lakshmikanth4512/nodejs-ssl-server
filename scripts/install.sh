#!/bin/bash
echo "===== INSTALL SCRIPT STARTED ====="

# Install Docker if not already installed
if ! command -v docker &> /dev/null
then
    echo "Installing Docker..."
    sudo yum update -y
    sudo yum install -y docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
else
    echo "Docker already installed"
    sudo service docker restart
fi

echo "===== INSTALL SCRIPT ENDED ====="
