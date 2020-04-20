import groovy.json.JsonSlurper

// pipeline {
  
//   agent any
  
//     stages {
//         stage('deploy') {
//                 steps {
//                 withCredentials([azureServicePrincipal('msr-master-spn')]) {
//                     sh '''
//                         az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
//                         az account set --subscription $AZURE_SUBSCRIPTION_ID
//                         az group create -l westus -n MyResourceGroup --tags session=234567893egshdjchasd userId=12345673456 timeOut=1800000
//                     '''
//                 }
//             }
//         }
//     }
// }

pipeline {
  
  agent any
  
    stages {

        stage('Set Terraform path') {
            steps {
                script {
                    def tfHome = tool name: 'Terraform'
                    env.PATH = “${tfHome}:${env.PATH}”
                }
                sh 'terraform -- version'
        
        
            }
        }
        // stage('deploy') {
        //         steps {
        //         withCredentials([azureServicePrincipal('msr-master-spn')]) {
        //             sh '''
        //                 az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET -t $AZURE_TENANT_ID
        //                 az account set --subscription $AZURE_SUBSCRIPTION_ID
        //             '''
        //             'terraform init'
        //         }
        //     }
        // }
    }
}

// pipeline {
//  agent any
 
//     stages {
//         stage('checkout') {
//             steps {
//                 git branch: 'develop', url: 'git@your url'
            
//             }
//         }
//         stage('Set Terraform path') {
//             steps {
//                 script {
//                     def tfHome = tool name: 'Terraform'
//                     env.PATH = “${tfHome}:${env.PATH}”
//                 }
//                 sh 'terraform -- version'
        
        
//             }
//         }
        
//         stage('Provision infrastructure') {
        
//             steps {
//                 dir('dev')
//                 {
//                     sh 'terraform init'
//                     sh 'terraform plan -out=plan'
//                 // sh 'terraform destroy -auto-approve'
//                     sh 'terraform apply plan'
//                 }
        
        
//             }
//         }
//     }
// }