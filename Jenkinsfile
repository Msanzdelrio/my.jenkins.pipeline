import groovy.json.JsonSlurper

pipeline {
  
  agent any
  
  environment {
    PATH = "C:\\Program Files\\Git\\usr\\bin;C:\\Program Files\\Git\\bin;${env.PATH}"    
  }
  
  stages {
    stage('deploy') {
      steps {
        withCredentials([azureServicePrincipal('masterspn')]) {
          bat 'az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID'
        }
      }
    }
  }
}
