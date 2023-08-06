pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the source code from the repository
                git 'https://github.com/NwannedinmaAnibude/class-15-assignment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Change to the directory where your Terraform configuration files are located
                dir('terraform') {
                    // Initialize Terraform
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    // Plan the Terraform deployment
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    // Apply the Terraform changes to create the S3 bucket
                    input message: 'Deploy to AWS?', submitter: 'admin'
                    sh 'terraform apply tfplan'
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                dir('terraform') {
                    // Optionally, include a stage to destroy the S3 bucket (for cleanup)
                    // This stage can be triggered manually or automatically based on your requirements.
                    input message: 'Destroy AWS resources?', submitter: 'admin'
                    sh 'terraform destroy'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment succeeded!'
        }
        failure {
            echo 'Deployment failed!'
        }
        always {
            // Clean up any temporary files or resources if needed
            dir('terraform') {
                deleteDir()
            }
        }
    }
}
