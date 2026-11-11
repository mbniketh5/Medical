pipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'pj-1',
                    usernameVariable: 'DOCKER-USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t mbniketh5/myapp:v1 .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push mbniketh5/myapp:v1'
            }
        }
    }
}
