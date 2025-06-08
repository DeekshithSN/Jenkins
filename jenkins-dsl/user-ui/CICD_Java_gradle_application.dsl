pipelineJob('user-ui/CICD_Java_gradle_application') {

   description('this is to build java gradle software')
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
                        url('https://github.com/DeekshithSN/CICD_Java_gradle_application.git')
                    }
                    branch('master')
                }
            }
            scriptPath("Jenkinsfile")
        }
    }
}