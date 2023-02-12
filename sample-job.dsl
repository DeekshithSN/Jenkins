pipelineJob('example.dsl') {

   description('this is dsl example')
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
                        url('https://github.com/DeekshithSN/shared-library.git')
                    }
                    branch('master')
                }
            }
            scriptPath("Jenkinsfile")
        }
    }
}
