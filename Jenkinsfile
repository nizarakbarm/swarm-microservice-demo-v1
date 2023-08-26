pipeline {
  environment {
    dockerimagename = "findnull45/result-app"
    dockerImage = ""
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'result-app', url: 'https://github.com/nizarakbarm/swarm-microservice-demo-v1.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          sh 'docker build -t $dockerimagename result-app'
        }
      }
    }
    stage('Login') {
        steps {
            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        }
    }
    stage('Pushing Image') {
      steps{
            sh 'docker push $dockerimagename'
        }
    }
    stage('Deploy result-app') {
      steps {
        script {
          sh "kubectl --kubeconfig=/home/devnull/.kube/config get deployments result-app"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f result-app.yaml"
        }
      }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
  }
}