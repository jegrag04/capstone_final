pipeline {
    agent any
    stages{
        stage("Build") {
            steps {
                script{
                    sh 'chmod +x build.sh'
                    sh './build.sh'
                }
            }
        }
        stage("Deploy") {
            steps {
                script{
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
   }
}   
