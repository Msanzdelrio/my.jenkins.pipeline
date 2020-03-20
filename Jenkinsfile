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
          bat 'az login --service-principal --username $AZURE_CLIENT_ID --tenant $AZURE_TENANT_ID --password $AZURE_CLIENT_SECRET'
        }
      }
    }
  }
}
