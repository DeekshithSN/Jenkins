currentBuild.displayName = "test-ui #"+currentBuild.number

  def setJobDescription(){
        currentBuild.displayName = "branch name"+env.BRANCH_NAME
        }

pipeline {

    agent {
            docker {
                image 'maven'
            }
        }
    stages {
        
        stage('init'){
            steps{
                setJobDescription()
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
