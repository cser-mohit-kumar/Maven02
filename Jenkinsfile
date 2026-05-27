pipeline {
    agent any
    environment {
        IMAGE_NAME = "snake-game"
        CONTAINER_NAME = "snake-container"
        DISPLAY = ":1"
    }
    stages {
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Remove Old Container') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d --name $CONTAINER_NAME \
                    -e DISPLAY=:1 \
                    -v /tmp/.X11-unix:/tmp/.X11-unix \
                    $IMAGE_NAME'
            }
        }
    }
    post {
        success { echo 'Pipeline executed successfully!' }
        failure { echo 'Pipeline failed!' }
    }
}
