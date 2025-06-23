#!/bin/bash
echo "===== STOP SCRIPT STARTED ====="

# Stop and remove old container if it exists
if docker ps -a --format '{{.Names}}' | grep -wq "nodejs-app"; then
  echo "Stopping existing container: nodejs-app"
  docker stop nodejs-app
  docker rm nodejs-app
else
  echo "No container found with name nodejs-app"
fi

echo "===== STOP SCRIPT ENDED ====="
