pipeline {
  environment {
    dockerimagename = "findnull45/vote-worker"
    dockerImage = ""
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'vote-worker', url: 'https://github.com/nizarakbarm/swarm-microservice-demo-v1.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          sh 'docker build . -t $dockerimagename'
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
    stage('Deploy vote-worker') {
      steps {
        script {
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f vote-worker.yaml"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config get deployments vote-worker -o jsonpath='{.status.conditions[1].status}'"
        }
      }
    }
  }
  post {
    always {
            sh 'docker logout'
        }
    }
}