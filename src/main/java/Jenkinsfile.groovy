pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                // Use Maven to build the project
                echo "Good morning, YOUR_NAME, Welcome to Comp367"

                echo "Good afternoon Your_Name, Welcome to Comp367"
            }
        }
    }
}
