pipelineJob('job.dsl') {
    description('My First DSL job')
    triggers {
        cron('* * * * *')
    }
    logRotator {
        numToKeep(5)
        artifactNumToKeep(1)
    }
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/edmondgodwin/Jenkins.git')
                    }
                    branch('master')
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
