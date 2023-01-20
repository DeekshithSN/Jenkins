currentBuild.displayName = "test-ui #"+currentBuild.number


pipeline {

    environment{
        script_options = "--clean 30"
        docker_password = credentials('docker-usr-pass')
    }
    agent any
    stages {
        
        stage('init'){
            steps{
                script{
                echo "$script_options"
                sh 'echo this first stage'
                sh 'docker login -u $docker_password_USR -p $docker_password_PSW'
                }
            }
        }
        stage('secondstage'){
            agent {
                    docker {
                        image 'maven'
                    }
                }
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
