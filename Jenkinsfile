pipeline {
    agent any

    environment {
        IMAGE_NAME = "dhineshkumar375/n8n-custom:latest"
    }

    stages {
        stage('Clone Source') {
            steps {
                echo 'Cloning the n8n repository...'
                // Already cloned by Jenkins when using SCM, so this is just a placeholder
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $IMAGE_NAME ."
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"
                        sh "docker push $IMAGE_NAME"
                    }
                }
            }
        }
    }
}

