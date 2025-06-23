#!/bin/bash
echo "===== STOP SCRIPT STARTED ====="

# Stop and remove old container
if docker ps -a --format '{{.Names}}' | grep -Eq "^nodejs-app$"; then
  echo "Stopping existing container..."
  docker stop nodejs-app
  docker rm nodejs-app
else
  echo "No running container found with name nodejs-app"
fi

echo "===== STOP SCRIPT ENDED ====="
