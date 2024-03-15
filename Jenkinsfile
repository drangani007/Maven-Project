pipeline {
    agent any
    tools {
        maven "MAVEN3"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Maven Project') {
            steps {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '08715572-302e-4b21-b8ae-ec35d792cb70', url: 'https://github.com/drangani007/Maven-Project.git']])
                    sh 'mvn -Dmaven.test.failure.ignore=true clean package'
            }
        }
        stage('Build Docker Image'){
            steps{
                script{
                    sh "docker build -t dhruvilrangani/my-app-image ."
                }
            }
        }
    }
}
