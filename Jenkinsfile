pipeline {
  agent any
  environment {
    WORKSPACE = "${env.WORKSPACE}"
  }
  tools {
    maven 'localMaven'
    jdk 'localJdk'
    terraform 'terraform-1.0.3'
  }
 
  stages{
    stage('Git Checkout'){
        sh "https://github.com/doebialale/terraform-poc.git"
    }
     
    stage('Terraform Init'){
         sh "terraform init"
         
    }
     
    stage('Terraform Apply')
      { 
        sh "terrform apply --auto-approve"
      }
  }
}
