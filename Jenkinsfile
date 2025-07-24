pipeline {
    agent {
        docker { image 'python:3.10' }
    }
    stages {
        stage('Run Service') {
            steps {
                sh './start_pipeline.sh'
            }
        }
    }
}