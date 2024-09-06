pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout the latest code from your repository
                git url: 'https://your-repo-url.git', branch: 'main'
            }
        }
        
        stage('Install Flutter') {
            steps {
                // Install Flutter SDK or ensure it's installed
                sh '''
                if ! [ -x "$(command -v flutter)" ]; then
                    echo "Flutter is not installed, installing..."
                    git clone https://github.com/flutter/flutter.git -b stable
                    export PATH="$PATH:$PWD/flutter/bin"
                fi
                flutter --version
                '''
            }
        }

        stage('Flutter Test') {
            steps {
                // Run Flutter tests
                sh 'flutter test'
            }
        }
    }

    post {
        always {
            // Archive test results and notify
            junit '**/test/*.xml'
        }
    }
}
