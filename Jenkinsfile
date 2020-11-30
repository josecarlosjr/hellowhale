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
              //sh 'docker --version'
              //sh 'lsb_release -a'
              //sh 'ls -la' mostra os arquivos do worspace
              //sh 'pwd' //mostra a raiz do workspace 
              //sh 'cat /etc/os-release'
              //sh 'sudo su'
              //sh 'hwclock --hctosys'//sh 'timedatectl'              
              
              //sh 'apt-get update'
              //sh 'apt-get install -y apt-transport-https software-properties-common'
              
              //sh 'apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common'              
              
              //sh 'curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -'
              //sh 'add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"'
              //sh 'apt-get update'
              //sh 'apt-get install -y docker-ce'// docker-ce-cli'
              
              sh 'apk update'
              //sh 'apk add --no-cache'              
              sh 'apk add py-pip python3-dev libffi-dev openssl-dev gcc libc-dev make'
              sh 'apk add docker docker-compose'              
              //sh 'apk add openrc docker-openrc '// --no-cache'
              //sh 'rc-update add docker boot'              
              //sh 'rc-service openrc restart'
              //sh 'rc-status -a'              
              sh '/etc/init.d/docker restart'
              //sh 'apt-get install systemd'
              
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
