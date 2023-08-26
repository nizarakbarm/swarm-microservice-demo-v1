pipeline {

  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'Redis', url: 'https://github.com/nizarakbarm/swarm-microservice-demo-v1.git'
      }
    }

    stage('Deploying redis') {
      steps {
        script {
          sh "kubectl --kubeconfig=/home/devnull/.kube/config get deployments"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f Redis/redis.yaml"
        }
      }
    }
  }
}