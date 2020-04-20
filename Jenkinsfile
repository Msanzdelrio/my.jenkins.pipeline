pipeline {
    agent any
  
    parameters {
            string(name: 'tags', description: '', defaultValue: 'session:234567893egshdjchasd,userId:12345673456,timeOut:1800000')
    }
  
    stages {

        stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = "${tfHome}:${env.PATH}"
                }
                sh 'terraform -version'        
            }
        }
        stage('deploy') {
                steps {
                withCredentials([azureServicePrincipal('msr-master-spn')]) {
                    sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                        az account set --subscription $AZURE_SUBSCRIPTION_ID
                        terraform init
                        terraform plan -out=plan -var=tenant_id=$AZURE_TENANT_ID \
                                        -var=subscription_id=$AZURE_SUBSCRIPTION_ID \
                                        -var=client_id=$AZURE_CLIENT_ID \
                                        -var=client_secret=$AZURE_CLIENT_SECRET \
                                        -var=tags='{environment = \"Testing\"}'
                        terraform apply plan
                    '''
                }
            }
        }
    }
}

def getMap(stringvalue){
    def result = stringvalue.split(',').inject([:]) { map, token ->          
        token.split(':').with {          
            map[it[0].trim()] = it[1].trim()      
            }     
        map
        }
    return result 
}