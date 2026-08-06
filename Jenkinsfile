pipeline {
    agent any

    environment {
        SERVER_REGION = 'us-east-1'
        BUILD_ENV = 'development'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo "Checked out bootcamp scripts from Git"
                echo "Labs location: /home/ssm-user/bootcamp-labs"
            }
        }

        stage('Script Validation') {
            steps {
                echo "Validating scripts..."
                sh '''
                    cd scripts
                    echo "=== Script Validation ==="
                    for script in *.sh; do
                        if [ -f "$script" ]; then
                            echo "Checking syntax: $script"
                            bash -n "$script" && echo "✓ $script syntax OK" || echo "✗ $script syntax error"
                        fi
                    done
                '''
            }
        }

        stage('Test Scripts') {
            steps {
                echo "Testing bootcamp scripts..."
                sh '''
                    cd scripts
                    echo "=== Testing Scripts ==="
                    chmod +x *.sh

                    if [ -f "system-info.sh" ]; then
                        echo "Testing system info script..."
                        ./system-info.sh
                    fi

                    if [ -f "health-check.sh" ]; then
                        echo "Testing health check script..."
                        ./health-check.sh
                    fi
                '''
            }
        }

        stage('Deploy Scripts') {
            when {
                branch 'master'
            }
            steps {
                echo "Deploying scripts to /home/ssm-user/bootcamp-labs"
                sh '''
                    cd scripts
                    echo "=== Deploying Bootcamp Scripts ==="

                    mkdir -p /home/ssm-user/bootcamp-labs/scripts

                    cp *.sh /home/ssm-user/bootcamp-labs/scripts/
                    chmod +x /home/ssm-user/bootcamp-labs/scripts/*.sh

                    echo "Deployment completed successfully"
                    ls -la /home/ssm-user/bootcamp-labs/scripts/
                '''
            }
        }
    }

    post {
        always {
            echo "Bootcamp Pipeline completed"
            archiveArtifacts artifacts: 'scripts/*.sh', allowEmptyArchive: true
        }
        success {
            echo "Bootcamp Pipeline succeeded!"
        }
        failure {
            echo "Bootcamp Pipeline failed!"
        }
    }
}
