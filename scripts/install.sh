#!/bin/bash
echo "Installing Docker if not present..."
sudo yum install -y docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
