pipeline {
    stages {
        stage('Connect') {
            steps {
                powershell ("""
                    $tenantId = "79d59814-24a2-46fc-8076-7a9fbfc5c807"
                    $clientID = "3bf9087d-a5ae-493d-9280-fb0391a78359"
                    $key = "7.7@dK7BOAvSBuEK]?3.FJmQXlOCkZ7r"
                    $cred = $key | ConvertTo-SecureString -AsPlainText -Force
                    $credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist $clientID, $cred
                    Connect-AzAccount -TenantId $tenantId -ServicePrincipal -Credential $credentials
                    Get-AzAcontext
                """)
            }
        }
    }
}