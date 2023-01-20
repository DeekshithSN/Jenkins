currentBuild.displayName = "test-ui #"+currentBuild.number
currentBuild.description = "executed on"+env.NODE_NAME

pipeline {

    agent {
            docker {
                image 'maven'
            }
        }
    stages {
        
        stage('init'){
            steps{
                sh 'echo this first stage'
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
