pipeline{
    agent any
    environment{
        script_options = '--clean30'
        Docker_cred = credentials('docker-cred')
    }
    options{
       buildDiscarder(logRotator(numToKeepStr: '5'))
        timestamps() 
    }
    stages{
        stage('clone'){
            agent {
                docker {
                    image 'maven'
                }
            }
            environment{
                script_options = '--clean 50'
            }
            steps{
                sh 'mvn --version'
                sh 'printenv'
                sh 'echo $script_options'
            }
        }

        stage('build'){
            steps{
                sh 'echo node version'
                sh 'printenv'
            }
            post{
                success{
                    sh 'echo build completed'
                }
                aborted{
                    sh 'echo build aborted'
                }
            }
        }

        stage('docker login'){
            steps{
                sh 'docker login -u $Docker_cred_USR -p $Docker_cred_PSW'
            }
        }

        stage('Parallel'){
            parallel {
                stage('docker build'){
                    steps{
                        sh 'echo docker build'
                    }
                }
                stage('docker push'){
                    steps{
                        sh 'echo docker push'
                    }
                }
        
            }
        }
    }
    post{
        always{
            cleanWs()
        }
    }
}
