pipeline {
    agent any

    stages {
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'pj-1',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                    '''
                }
            }
        }

        stage('Build Dashboard') {
            steps {
                sh 'docker build -t mbniketh5/dashboard:v3 ./dashboard'
            }
        }

        stage('Build Inventory') {
            steps {
                sh 'docker build -t mbniketh5/inventory:v3 ./inventory'
            }
        }

        stage('Build Reports') {
            steps {
                sh 'docker build -t mbniketh5/reports:v3 ./reports'
            }
        }

        stage('Push Dashboard') {
            steps {
                sh 'docker push mbniketh5/dashboard:v3'
            }
        }

        stage('Push Inventory') {
            steps {
                sh 'docker push mbniketh5/inventory:v3'
            }
        }

        stage('Push Reports') {
            steps {
                sh 'docker push mbniketh5/reports:v3'
            }
        }
    }
}
