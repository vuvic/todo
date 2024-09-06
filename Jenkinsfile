pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                bat 'flutter build'
            }
        }
        stage('Test') {
            steps {
                bat 'flutter test --machine > test/results/test-results.xml'
            }
        }
    }
    
    post {
        always {
            junit 'test/results/test-results.xml'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
