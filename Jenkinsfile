pipeline {
    agent any

    stages {

        stage('Clone') {
            steps {
                git 'https://github.com/user/website-project.git'
            }
        }

        stage('Build Image') {
            steps {
                sh 'docker build -t username/website:v1 .'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push username/website:v1'
            }
        }

        stage('Deploy') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
            }
        }
    }
}
