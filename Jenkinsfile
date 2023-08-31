pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'cleanc-github-app',
                                          usernameVariable: 'GITHUB_APP',
                                          passwordVariable: 'GITHUB_ACCESS_TOKEN')]) {
                    sh 'echo "$GITHUB_ACCESS_TOKEN" | docker login ghcr.io -u "$GITHUB_APP" --password-stdin'
                    sh './build-and-push.sh'
                }
            }
        }
    }
}
