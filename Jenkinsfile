pipeline {
    agent any
    environment {
        DISABLE_AUTH = 'true'
        DB_ENGINE    = 'sqlite'
    }   
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
		    sh 'echo "Deploying from branch $GIT_BRANCH " ' 
                    sh 'chmod +x deploy.sh'
                    sh './deploy.sh'
                }
            }
        }
   }
}   
