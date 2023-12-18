pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                
                // Update package information
                sh 'sudo apt-get update'

                // Install Python3 pip
                sh 'sudo apt-get install python3-pip'

                // Install request package
                sh 'sudo pip3 install requests'

            }
        }

        stage('Run Tests') {
            steps {
                // Run Python test script
                sh 'python3 test.py'
            }
        }
    }
   
}
