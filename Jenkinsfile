def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]
pipeline {
    agent any
    environment {
        registryCredential = 'ecr:us-west-2:awscreds'
        appRegistry = "471112735223.dkr.ecr.us-west-2.amazonaws.com/capstone_repo"
        capstRegistry = "https://471112735223.dkr.ecr.us-west-2.amazonaws.com"
        cluster = "capstonsecls" 
        service = "capstonesvc"
    }
    stages{
        stage("Build App Image") {
            steps {
                script{
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                }
            }
        }
        stage("Upload App Image") {
            steps {
                script{
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
		
        stage('Upload App Image to ECR') {
            steps{
                script {
                docker.withRegistry( capstRegistry, registryCredential ) {
                    dockerImage.push("$BUILD_NUMBER")
                    dockerImage.push('latest')
                }
                }
            }
        }
        stage('Deploy to ecs') {
          steps {
        withAWS(credentials: 'awscreds', region: 'us-west-2') {
          sh 'aws ecs update-service --cluster ${cluster} --service ${service} --force-new-deployment'
        }
      }
     }
    }
}   
