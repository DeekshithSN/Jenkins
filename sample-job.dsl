pipelineJob('example') {
    definition {
        parameters {
        choiceParam('myParameterName', ['option 1 (default)', 'option 2', 'option 3'], 'my description')
     }
        cps {
            script(readFileFromWorkspace('project-a-workflow.groovy'))
            sandbox()
        }
    }
}
