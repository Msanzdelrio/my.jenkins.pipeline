import groovy.json.JsonSlurper

node {
  stage('init') {
    checkout scm
  }
  
  stage('deploy') {
    withCredentials([azureServicePrincipal('masterspn')]) {
      echo "My client id is $AZURE_CLIENT_ID"
      echo "My client secret is $AZURE_CLIENT_SECRET"
      echo "My tenant id is $AZURE_TENANT_ID"
      echo "My subscription id is $AZURE_SUBSCRIPTION_ID"
      sh "az login --service-principal --username ${AZURE_CLIENT_ID} --tenant ${AZURE_TENANT_ID} --password ${AZURE_CLIENT_SECRET}"
    }
  }
}
