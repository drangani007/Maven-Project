pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Maven Project') {
            steps {
                // Use the configured Maven installation 'MAVEN3'
                tool 'MAVEN3'
                sh 'mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t dhruvilrangani/my-app-image .'
            }
        }
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push dhruvilrangani/my-app-image'
            }
        }
    }
}
