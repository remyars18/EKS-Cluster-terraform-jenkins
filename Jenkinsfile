pipeline {
    agent any
    
    stages {
        stage('print hello') {
            steps {
                echo 'this is a sample pipeline'
            }
        }
        stage('Install apache') {
            steps {
                // to install apache server
                sh 'sudo yum update -y'
                sh 'sudo yum install httpd -y'
                sh 'sudo systemctl enable httpd'
                sh 'sudo systemctl start httpd'
            }
        }
        
    }
}