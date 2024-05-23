pipeline {
    agent any
    stages{
        stage("Build") {
            steps {
                script{
                    sh './build.sh'
                }
            }
        }
        stage("Deploy") {
            steps {
                script{
                    sh './deploy.sh'
                }
            }
        }
   }
}   
