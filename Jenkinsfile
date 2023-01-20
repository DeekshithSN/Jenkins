currentBuild.displayName = "test-ui #"+currentBuild.number

  def setJobDescription(string b_name){
        currentBuild.description = "branch name"+b_name
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
                setJobDescription(env.BRANCH_NAME)
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
