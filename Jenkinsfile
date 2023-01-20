currentBuild.displayName = "test-ui #"+currentBuild.number


pipeline {

    agent {
            docker {
                image 'maven'
            }
        }
    stages {
        
        stage('init'){
            steps{
                script{
                sh 'echo env.BRANCH_NAME'
                sh 'echo this first stage'
                }
            }
        }
        stage('secondstage'){
            steps{
                sh 'mvn --version'
            }
        }
        stage('3stage'){
            steps{
                sh 'echo this 3rd stage'
            }
        }
    }
    post{
        always{
            cleanWs()
        }
    }
}
