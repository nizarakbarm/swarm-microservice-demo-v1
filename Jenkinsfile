pipeline {

  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git 'https://github.com/nizarakbarm/swarm-microservice-demo-v1.git'
      }
    }

    stage('Deploying postgres-db') {
      steps {
        script {
          kubernetesDeploy(configs: "PostgreSQL/postgres-db.yaml")
        }
      }
    }
  }
}