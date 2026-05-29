pipeline {
    agent any

    environment {
        IMAGE_NAME = "snake-game"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/YOUR_USERNAME/YOUR_REPO.git'  // ← fix this
            }
        }

        stage('Build Docker Image') {
            steps {
                // If Jenkins runs on Linux, use sh not bat
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }

        stage('Load Image into Minikube') {
            steps {
                sh 'minikube image load ${IMAGE_NAME}'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yml'   // ← match your actual filename
                sh 'kubectl apply -f service.yml'
            }
        }
    }
}
