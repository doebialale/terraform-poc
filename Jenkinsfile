pipeline{
    
    agent any
    
    tools {
  terraform 'terraform-1.0.3'
}
 stages{
     
     stage('Git Checkout'){
         command 
     }
     
     stage('Terraform Init'){
         sh "terraform init"
         
     }
     
     stage('Terraform Apply'){
 
         sh "terrform apply --auto-approve"
     }
 }
}
 
 
 
 
 
}