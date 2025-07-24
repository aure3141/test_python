# 🐳 Docker Setup for Wrap Audio Project

This project is now containerized and ready to run with Docker!

## 📁 Files Added

- `Dockerfile` - Main Docker configuration
- `docker-compose.yml` - Docker Compose setup
- `.dockerignore` - Files to exclude from Docker build
- `start_docker.sh` - Quick start script
- `stop_docker.sh` - Quick stop script

## 🚀 Quick Start

### Option 1: Using Shell Scripts (Recommended)
```bash
# Start the application
./start_docker.sh

# Stop the application
./stop_docker.sh
```

### Option 2: Using Docker Commands
```bash
# Build the image
docker build -t wrap-audio-app .

# Run the container
docker run -d --name wrap-audio-container -p 8000:8000 wrap-audio-app

# Stop the container
docker stop wrap-audio-container
docker rm wrap-audio-container
```

### Option 3: Using Docker Compose
```bash
# Start with Docker Compose
docker-compose up -d

# Stop with Docker Compose
docker-compose down
```

## 🌐 Access the Application

After starting the container, your FastAPI application will be available at:
- **Main App**: http://localhost:8000
- **Health Check**: http://localhost:8000/status
- **API Docs**: http://localhost:8000/docs (FastAPI auto-generated)

## 🔧 Useful Commands

```bash
# View container logs
docker logs wrap-audio-container

# View running containers
docker ps

# Access container shell
docker exec -it wrap-audio-container bash

# Check health status
curl http://localhost:8000/status
```

## 🏗️ CI/CD with Jenkins

The updated `Jenkinsfile` now includes:
- Docker image building
- Container testing
- Automated deployment
- Health checks
- Cleanup

## 🔒 Security Features

- Non-root user in container
- Health checks enabled
- Minimal base image (python:3.10-slim)
- Proper environment isolation

## 📊 Monitoring

The container includes health checks that run every 30 seconds to ensure the application is responsive.
