pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your code from version control
                // Use the appropriate SCM command for your repository
                git branch: 'main', url: 'https://github.com/NwannedinmaAnibude/class-15-assignment.git'
            }
        }

        stage('Terraform Init') {
            steps {
                // Run Terraform init to initialize the working directory
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run Terraform plan to preview changes
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Run Terraform apply to create the S3 bucket
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }

    post {
        always {
            // Clean up Terraform temporary files
            sh 'rm -rf .terraform terraform.tfstate* tfplan'
        }
    }
}
