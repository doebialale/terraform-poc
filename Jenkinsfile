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
    stage('Terraform Plan'){
      steps{
        sh 'terraform plan'
      }        
         
    }


    stage('Terraform Prod'){
      steps{
        sh 'terraform apply --auto-approve'
      }        
         
    }

  }
}
