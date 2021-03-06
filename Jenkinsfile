pipeline {
    agent any
    
    parameters {
        string(name: 'sp', description: 'Name of the generated app', defaultValue: 'msr-master-spn')
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
                    withCredentials([azureServicePrincipal(params.sp)]) {
                    sh '''
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
                        az account set --subscription $AZURE_SUBSCRIPTION_ID
                        terraform init
                        terraform plan -out=plan -var=tenant_id=$AZURE_TENANT_ID \
                                        -var=subscription_id=$AZURE_SUBSCRIPTION_ID \
                                        -var=client_id=$AZURE_CLIENT_ID \
                                        -var=client_secret=$AZURE_CLIENT_SECRET
                        terraform apply plan
                    '''
                }
            }
        }
    }
}
