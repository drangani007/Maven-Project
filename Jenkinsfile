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
                script{
                    def dockerExecutable = '"C:/Program Files/Docker/Docker/docker.exe"'
                    sh "${dockerExecutable} build -t dhruvilrangani/my-app-image ."
                }
            }
        }
        stage('Docker Login') {
            steps {
                script{
                    def dockerExecutable = '"C:/Program Files/Docker/Docker/docker.exe"'
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        sh "${dockerExecutable} -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script{
                    def dockerExecutable = '"C:/Program Files/Docker/Docker/docker.exe"'
                    sh "${dockerExecutable} push dhruvilrangani/my-app-image"
                }
            }
        }
    }
}
