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
              sh 'lsb_release -a'
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
