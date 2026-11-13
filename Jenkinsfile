pipeline {
    agent any

    environment {
        MAIN_IMAGE = 'mbniketh5/myapp-main'
        DASH_IMAGE = 'mbniketh5/myapp-dashboard'
    }

    stages {

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'pj-1',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                        set +x
                        echo "$DOCKER_PASS" | docker login \
                        -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Build Main Website') {
            steps {
                sh '''
                    docker build \
                    -t ${MAIN_IMAGE}:v4 \
                    -f Dockerfile .
                '''
            }
        }

        stage('Push Main Website') {
            steps {
                sh 'docker push ${MAIN_IMAGE}:v4'
            }
        }

        stage('Build Dashboard Microservice') {
            steps {
                sh '''
                    docker build \
                    -t ${DASH_IMAGE}:v4 \
                    -f dashboard/Dockerfile dashboard/
                '''
            }
        }

        stage('Push Dashboard Microservice') {
            steps {
                sh 'docker push ${DASH_IMAGE}:v4'
            }
        }
    }

    post {
        success {
            echo 'Both PharmaCare images built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the Jenkins console output.'
        }
    }
}
