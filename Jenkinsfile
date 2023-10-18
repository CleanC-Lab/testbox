pipeline {
    agent {
        docker {
            image 'ghcr.io/cleanc-lab/docker:latest'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Docker login') {
            environment {
                GHCR_TOKEN = credentials('jenkins-github-pat-package-rw')
            }
            steps {
                sh 'echo $GHCR_TOKEN_PSW | docker login ghcr.io -u $GHCR_TOKEN_USR --password-stdin'
            }
        }
        stage('Build') {
            steps {
                sh './build-and-push.sh'
            }
        }
    }
    post {
        always {
            sh 'docker logout "ghcr.io"'
        }
    }
}
