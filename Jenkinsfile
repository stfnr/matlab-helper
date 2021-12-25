pipeline {
    agent any
    environment {
        PATH = "${PATH}:/Applications/MATLAB_R2018b.app/bin"
    }
    stages {
        stage('Run tests'){
            steps {
                runMATLABTests{
                    testResultsJUnit: 'matlabTestArtifacts/junittestresults.xml',
                    codeCoverageCobertura. 'matlabTestArtifacts/cobertura.xml'
                }
            }
        }
    }
}
