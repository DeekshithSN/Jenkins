pipeline {

    agent any
    stages {
        
        stage('init'){
            steps{
                sh 'echo this first stage'
            }
        }
        stage('secondstage'){
            agent {
                docker {
                    image 'maven'
                }
            }
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
}
