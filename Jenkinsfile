pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'flutter build'
            }
        }
        stage('Test') {
            steps {
                sh 'flutter test --machine > test/results/test-results.xml'
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
