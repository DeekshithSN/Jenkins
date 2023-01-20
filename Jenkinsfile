currentBuild.displayName = "test-ui #"+currentBuild.number


pipeline {

    environment{
        script_options = "--clean 30"
        branchname = env.BRANCH_NAME
    }
    agent {
            docker {
                image 'maven'
            }
        }
    stages {
        
        stage('init'){
            steps{
                script{
                echo "$script_options"
                sh 'echo this first stage'
                }
            }
        }
        stage('secondstage'){
            steps{
                sh 'printenv'
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
