pipeline {
  agent any
  
  tools {
    terraform 'Terraform 11'
  }

  stages{

    stage('Git Checkout'){
      steps{
        git 'https://github.com/doebialale/terraform-poc'
      }
      
    }
     
    stage('Terraform Init'){
      steps{
        sh 'terraform init'
      }        
         
    }

    stage('Terraform Apply'){
      steps{
        sh 'terraform apply --auto-approve'
      }        
         
    }

  }
}
