pipeline {
    agent any

    environment {
        IMAGE_NAME = "dhineshkumar375/n8n:latest"
        DEPLOYMENT_FOLDER = "devops-k8s/n8n"
        KUBECONFIG = 'C:\\ProgramData\\Jenkins\\.kube\\config'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/m-dhineshkumar25/n8n.git'
            }
        }

        stage('Docker Push') {
            steps {
                bat "docker pull %IMAGE_NAME%"
                bat "docker push %IMAGE_NAME%"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat "kubectl apply -f %DEPLOYMENT_FOLDER%/deployment.yaml"
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs for details.'
        }
    }
}
