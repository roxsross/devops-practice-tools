pipeline {
    agent any

    stages {
        stage('AWS VALIDATE!') {
            steps {
                echo 'AWS STS'
                sh 'aws sts get-caller-identity'
            }
        }
        stage('AWS S3 listar') {
            steps {
                sh 'aws s3 ls'
            }
        } 
        stage('Git Clone') {
            steps {
                sh 'rm -rf static-website/'
                sh 'git clone https://github.com/roxsross/static-website.git'
                sh 'ls -lrt static-website/'
            }
        } 
        stage('Upload to S3') {
            steps {
                sh 'aws s3 cp static-website s3://leandroooo --recursive'
            }
        }         
    }
}
