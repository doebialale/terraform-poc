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

    stage('Terraform Init'){
         sh "terraform init"
         
    }
     
    stage('Terraform Apply')
      { 
        sh "terrform apply --auto-approve"
      }
  }
}
