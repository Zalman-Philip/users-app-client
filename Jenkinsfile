pipeline {
    agent any

    stages {
        stage('Build users client') {
            steps {
                echo 'Building...'
                // Add your build steps here
            }
        }

        stage('Lint users client') {
            steps {
                echo 'Linting...'
                // Add your linting steps here
            }
        }
    }
    post {
        success {
            script {
                echo 'Linting passeeed. You may now merge.'
            }
        }
        failure {
            script {
                echo 'Pipeline failed. Blocking pull request merge.'
            }
        }
    }
}
