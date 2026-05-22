pipeline {
    agent {
        node {
            label 'built-in'
        }
    }

    stages {

        stage('Clone') {
            steps {
                git url: 'https://github.com/cser-mohit-kumar/Maven02.git',
                    branch: 'main'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Run') {
            steps {
                sh '''
                    export DISPLAY=:1
                    java -jar target/Maven-1.0-SNAPSHOT.jar &
                '''
            }
        }

    }

    post {
        always {
            cleanWs()
        }
    }
}
