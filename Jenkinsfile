import groovy.json.JsonSlurper

node {
  stage('init') {
    checkout scm
  }
  
  stage('deploy') {
    withCredentials([azureServicePrincipal('masterspn')]) {
      echo "My client id is $AZURE_CLIENT_ID"
    }
  }
}
