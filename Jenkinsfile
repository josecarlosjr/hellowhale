pipeline {

  //agent any
  agent {label 'kubejenkins'}
  
  stages {

    stage('Checkout Source') {
      steps {
        git url:'https://github.com/josecarlosjr/hellowhale.git', branch:'master'
      }
    }
    
      stage("Build image") {
            steps {
              echo "testing the environment"
              /sh 'docker --version'
              //sh 'lsb_release -a'
              //sh 'ls -la' mostra os arquivos do worspace
              sh 'pwd' //mostra a raiz do workspace 
              sh 'cat /etc/os-release'
              //sh 'sudo su'
              //sh 'apt-get update'
              //sh 'apt-cache search docker'
              //sh 'apk update'
              //sh 'apk add --no-cache'
              sh 'docker --version'
              //sh 'apk add py-pip python3-dev libffi-dev openssl-dev gcc libc-dev make'
              //sh 'apk add docker-compose'
              //sh 'docker --version'
                script {
                    //myapp = docker.build("josecarlosjr/hellowhale:${env.BUILD_ID}")
                    myapp = docker.build("josecarlosjr/hellowhale")
                }
            }
        }
    
      stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

    
    stage('Deploy App') {
      steps {
        script {
          kubernetesDeploy(configs: "hellowhale.yml", kubeconfigId: "kconfig")
        }
      }
    }

  }

}
