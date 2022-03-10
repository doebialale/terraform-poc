pipeline {
  agent any
  
  tools {
    Docker 'Docker'
  }

  stages{

    stage('Git Checkout'){
      steps{
        git 'https://github.com/doebialale/terraform-poc'
      }
      
    }
     
    stage('Docker Build'){
      steps{
        sh 'docker build -t CentOS .'
      }        
         
    }
    stage('Container Build'){
      steps{
        sh 'docker run -d -p 80:80 --name CentOS CentOS'
      }        
         
    }


    stage('Terraform Prod'){
      steps{
        sh 'terraform apply --auto-approve'
      }        
         
    }

  }
}
