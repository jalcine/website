pipeline {
  agent {
    docker {
      image: 'ubuntu:bionic'
    }
    environment {
      ENV = 'development'
    }
    stages {
      stage('Build') {
        steps {
          sh 'npm install'
          sh 'bundle install'
        }
      }
      stage('Deliver') {
        imput message: 'we out?'
      }
    }
  }
}
