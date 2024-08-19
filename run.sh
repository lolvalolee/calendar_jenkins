echo 'here is script'
docker pull lolvalolee/calendar:latest

pipeline {
  agent any
  stages {
    stage('HelloWorld') {
      steps {
        echo 'Hello World'
      }
    }
    stage('git clone') {
      steps {
         cleanWs()
         sh 'git clone https://github.com/lolvalolee/calendar_jenkins.git'
         sh 'ls -la'
         sh 'chmod +x ./calendar_jenkins/run.sh'
         script {
             img = 'lolvalolee/calendar:latest'
             docker.image("${img}").run('-d -p 80:80')
         }
      }
    }
  }
}