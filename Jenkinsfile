pipeline {
    agent any
    tools{
        maven "MAVEN3"
    }
    stages {
        stage('Build Maven Project') {
            steps {
                // Your Maven build step
                sh 'mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '"C:/Program Files/Docker/Docker/resources/bin" build -t dhruvilrangani/my-app-image .'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh '"C:/Program Files/Docker/Docker/resources/bin" -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh '"C:/Program Files/Docker/Docker/resources/bin" dhruvilrangani/my-app-image'
            }
        }
    }
}
