pipeline {
    agent any

    environment {
        MAIN_IMAGE = 'mbniketh5/myapp-main'
        DASH_IMAGE = 'mbniketh5/myapp-dashboard'
	INVEN_IMAGE = 'mbniketh5/myapp-inventory'
	REPO_IMAGE = 'mbniketh5/myapp-reports'
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
                    -t ${MAIN_IMAGE}:v5 \
                    -f Dockerfile .
                '''
            }
        }

        stage('Push Main Website') {
            steps {
                sh 'docker push ${MAIN_IMAGE}:v5'
            }
        }

        stage('Build Dashboard Microservice') {
            steps {
                sh '''
                    docker build \
                    -t ${DASH_IMAGE}:v5 \
                    -f dashboard/Dockerfile dashboard/
                '''
            }
        }

        stage('Push Dashboard Microservice') {
            steps {
                sh 'docker push ${DASH_IMAGE}:v5'
            }
        }

        stage('Build Inventory Microservice') {
            steps {
                sh '''
                    docker build \
                    -t ${INVEN_IMAGE}:v5 \
                    -f inventory/Dockerfile inventory/
                '''
            }
        }

        stage('Push Inventory Microservice') {
            steps {
                sh 'docker push ${INVEN_IMAGE}:v5'
            }
        }

        stage('Build Reports Microservice') {
            steps {
                sh '''
                    docker build \
                    -t ${REPO_IMAGE}:v5 \
                    -f reports/Dockerfile reports/
                '''
            }
        }

        stage('Push Reports Microservice') {
            steps {
                sh 'docker push ${REPO_IMAGE}:v5'
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
         
