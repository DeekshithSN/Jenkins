currentBuild.displayName = "test-ui #"+currentBuild.number


pipeline {

    environment{
        script_options = "--clean 30"
        docker_password = credentials('docker-pass')
    }
    agent any
    stages {
        
        stage('init'){
            steps{
                script{
                echo "$script_options"
                sh 'echo this first stage'
                sh 'docker login -u deekshithsn -p $docker_password'
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
