pipeline {
    agent any

    environment {
        IMAGE_NAME = "dhineshkumar375/n8n-custom"
        TAG = "latest"
    }

    stages {
        stage('Clone Code') {
            steps {
                echo "Cloning source code..."
                git url: 'https://github.com/m-dhineshkumar25/n8n.git', branch: 'master'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image..."
                sh 'docker build -t $IMAGE_NAME:$TAG .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo "Pushing image to DockerHub..."
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push $IMAGE_NAME:$TAG'
                }
            }
        }
    }
}

