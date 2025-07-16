pipeline {
    agent any

    environment {
        IMAGE_NAME = "dhineshkumar375/n8n:latest"
        DEPLOYMENT_FOLDER = "devops-k8s/n8n"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git 'https://github.com/m-dhineshkumar25/n8n.git'
            }
        }

        stage('Docker Push') {
            steps {
                sh "docker pull ${IMAGE_NAME}" // Skip build and just pull
                sh "docker push ${IMAGE_NAME}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl apply -f ${DEPLOYMENT_FOLDER}/deployment.yaml"
                sh "kubectl apply -f ${DEPLOYMENT_FOLDER}/service.yaml"
            }
        }
    }
}
