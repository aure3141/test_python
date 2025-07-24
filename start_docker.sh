#!/bin/bash

# Build and run the Docker container

echo "🐳 Building Docker image..."
docker build -t wrap-audio-app .

echo "� Stopping existing container if running..."
docker stop wrap-audio-container 2>/dev/null || true
docker rm wrap-audio-container 2>/dev/null || true

echo "�🚀 Starting new container..."
docker run -d \
    --name wrap-audio-container \
    -p 8000:8000 \
    --restart unless-stopped \
    wrap-audio-app

echo "✅ Container started successfully!"
echo "🌐 Application is available at: http://localhost:8000"
echo "📊 Check status at: http://localhost:8000/status"

# Wait a moment and check health
echo "🔍 Checking health in 10 seconds..."
sleep 10
if curl -f http://localhost:8000/status > /dev/null 2>&1; then
    echo "✅ Health check passed!"
    echo "🎉 Application is running successfully!"
else
    echo "❌ Health check failed!"
    echo "📋 Check logs with: docker logs wrap-audio-container"
fi

echo ""
echo "�️ Useful commands:"
echo "📋 Check logs: docker logs wrap-audio-container"
echo "🔍 Check status: docker ps"
echo "🛑 Stop container: ./stop_docker.sh"
