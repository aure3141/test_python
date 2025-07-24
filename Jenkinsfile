pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'wrap-audio-app'
        DOCKER_TAG = "${BUILD_NUMBER}"
        CONTAINER_NAME = 'wrap-audio-container'
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building Docker image..."
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                    sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                }
            }
        }
        
        stage('Test Container') {
            steps {
                script {
                    echo "Testing Docker container..."
                    sh "docker run --rm --name test-container -d -p 8001:8000 ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh "sleep 10"
                    sh "curl -f http://localhost:8001/status || exit 1"
                    sh "docker stop test-container"
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    echo "Deploying application..."
                    // Stop and remove existing container if it exists
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                    """
                    // Run new container
                    sh """
                        docker run -d \
                            --name ${CONTAINER_NAME} \
                            -p 8000:8000 \
                            --restart unless-stopped \
                            ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
        
        stage('Health Check') {
            steps {
                script {
                    echo "Performing health check..."
                    sh "sleep 15"
                    sh "curl -f http://localhost:8000/status"
                    echo "Application is running successfully!"
                }
            }
        }
    }
    
    post {
        always {
            // Clean up test containers and old images
            sh '''
                docker container prune -f
                docker image prune -f
            '''
        }
        
        success {
            echo 'Pipeline completed successfully! 🎉'
            echo "Application is running at: http://localhost:8000"
        }
        
        failure {
            echo 'Pipeline failed! 💥'
            sh "docker logs ${CONTAINER_NAME} || true"
        }
    }
}