pipeline {
    agent any
    stages {
        stage('Install Dependencies') {
            steps {
                
                // Update package information
                sh ' apt-get update'

                // Install Python3 pip
                sh ' apt-get install -y python3-pip'

                // Install request package
                sh ' pip3 install requests -y'

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
