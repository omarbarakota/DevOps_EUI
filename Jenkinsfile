pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirments.txt
                python3 -m pytest
                '''
            }
        }
    }    
}