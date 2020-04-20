import groovy.json.JsonSlurper

pipeline {
  
  agent any

    parameters {
        string(name: 'tags', defaultValue: 'session:234567893egshdjchasd, userId:12345673456, timeOut:1800000', description: 'Tags applied to resource group')
    }
  
    stages {
        stage('deploy') {
                steps {
                withCredentials([azureServicePrincipal('msr-master-spn')]) {
                    sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                        az account set --subscription $AZURE_SUBSCRIPTION_ID
                        az group create -l westus -n MyResourceGroup --tags ${getArray(params.tags)}
                    '''
                }
            }
        }
    }
}