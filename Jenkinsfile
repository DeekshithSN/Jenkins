currentBuild.displayName = "test-ui #"+currentBuild.number


pipeline {

    environment{
        script_options = "--clean 30"
        docker_password = credentials('docker-usr-pass')
    }

    options { 
        buildDiscarder(logRotator(numToKeepStr: '5')) 
        timeout(time: 2, unit: 'MINUTES')  
        timestamps()
        }
    parameters { 
        string(name: 'DEPLOY_ENV', defaultValue: 'staging', description: 'this is env') 
        text(name: 'DEPLOY_TEXT', defaultValue: 'One\nTwo\nThree\n', description: 'this deloyment notes')
        }

    triggers { 
        cron('H */4 * * 1-5') 
        }

    agent any
    stages {
        
        stage('init'){
            steps{
                timeout(1){
                    script{
                        echo "$script_options"
                        sh 'echo this first stage'
                        sh 'docker login -u $docker_password_USR -p $docker_password_PSW'
                        sh "echo ${params.DEPLOY_ENV}"
                        currentBuild.description = "The branch built + $GIT_BRANCH"
                        addBadge(icon: 'green.gif', text: 'hello')
                    }
                }
            }
        }
        stage('secondstage'){

            when{
                environment  name:'GIT_BRANCH', value: 'origin/master'
            }
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
