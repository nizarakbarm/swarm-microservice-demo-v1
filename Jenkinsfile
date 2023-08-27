pipeline {
  environment {
    dockerimagename = "findnull45/web-vote-app"
    dockerImage = ""
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'Redis', url: 'https://github.com/nizarakbarm/swarm-microservice-demo-v1.git'
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
    stage('Deploying redis and web-vote-app') {
      steps {
        script {
          sh "kubectl --kubeconfig=/home/devnull/.kube/config get deployments"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f redis-configmap.yaml"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f redis_and_web_app_1.yaml"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f redis_and_web_app_2.yaml"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f redis_and_web_app_3.yaml"
          sh "kubectl --kubeconfig=/home/devnull/.kube/config apply -f service.yaml"
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