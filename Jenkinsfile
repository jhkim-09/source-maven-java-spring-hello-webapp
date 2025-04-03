pipeline {
  agent {
    label "jenkins-node"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', 
        url: 'https://github.com/jhkim-09/source-maven-java-spring-hello-webapp.git'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn clean package -DskipTests=true'
      }
    }
    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(
          publishers: [
            sshPublisherDesc(
              configName: 'ssh-tomcat', // 설정한 SSH 서버 이름
              transfers: [
                sshTransfer(
                  sourceFiles: 'target/hello-world.war', // 전송할 파일 경로
                  removePrefix: 'target', // 제거할 경로 prefix
                  execCommand: 'sudo mv hello-world.war /var/lib/tomcat9/webapps/' // 파일 전송 후 실행할 명령
                )
              ],
              verbose: true
            )
          ]
        )
      }
    }    
  }
}
