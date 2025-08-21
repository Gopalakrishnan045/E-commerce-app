pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = "gopalakrishnan045/ecommerce"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Gopalakrishnan045/E-commerce-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop api || true
                docker rm api || true
                docker run -d --name api -p 5000:5000 --network host ${DOCKER_HUB_REPO}:${BUILD_NUMBER}
                """
            }
        }
    }
}
