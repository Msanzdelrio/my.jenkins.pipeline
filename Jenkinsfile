import groovy.json.JsonSlurper

node {
  stage('init') {
    checkout scm
  }
  
  stage('deploy') {
    withCredentials([azureServicePrincipal('masterspn')]) {
      // login Azure
      sh '''
        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
        az account set -s $AZURE_SUBSCRIPTION_ID
      '''
      // log out
      sh 'az logout'
    }
  }
}
