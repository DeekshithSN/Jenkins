pipelineJob('web-application/sample-web-application') {

   description('this is to build java maven software')
   
    logRotator {
        numToKeep(5)
        artifactNumToKeep(1)
    }
    
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url('https://github.com/DeekshithSN/sample-web-application.git')
                    }
                    branch('master')
                }
            }
            scriptPath("Jenkinsfile")
        }
    }
}