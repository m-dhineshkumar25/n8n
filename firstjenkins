pipeline {
    agent any

    environment {
        IMAGE_NAME = "dhineshkumar375/n8n"
    }

    stages {
        stage('Clone Code') {
            steps {
                echo 'Cloning source code...'
                git url: 'https://github.com/m-dhineshkumar25/n8n.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }
    }
}
