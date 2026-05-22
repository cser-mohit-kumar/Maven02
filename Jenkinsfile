node {
    stage('Clone') {
        git branch: 'main',
            url: 'https://github.com/cser-mohit-kumar/Maven02.git'
    }
    stage('Run') {
        sh '''
            export DISPLAY=:1
            java -jar target/Maven-1.0-SNAPSHOT.jar &
        '''
    }
}
