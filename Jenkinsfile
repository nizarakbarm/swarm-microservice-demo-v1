pipeline {
  environment {
    dockerimagename = "findnull45/result-app"
    dockerImage = ""
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
          dockerImage = docker.build dockerimagename resultapp/Dockerfile
        }
      }
    }
    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhub-credentials'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploy result-app to kubernetes') {
      steps {
        script {
          sh "kubectl --kubeconfig=/home/devnull/.kube/config get deployments result-app"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f result-app/result-app.yaml"
        }
      }
    }
  }
}