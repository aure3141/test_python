#!/bin/bash

# Stop and remove the Docker container

echo "🛑 Stopping Docker container..."
docker stop wrap-audio-container || echo "Container was not running"

echo "🗑️ Removing container..."
docker rm wrap-audio-container || echo "Container was already removed"

echo "🧹 Cleaning up unused images..."
docker image prune -f

echo "✅ Cleanup completed!"
