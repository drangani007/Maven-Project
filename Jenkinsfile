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
                script {
                    def dockerImage = docker.build('dhruvilrangani/my-app-image')
                    dockerImage.inside {
                        // Additional commands to run inside the Docker container if needed
                    }
                }
            }
        }
    }
}
