pipeline {
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'python:2-alpine'
                }
            }
            steps {
                sh 'python -m py_compile sources/add2vals.py sources/calc.py'
            }
        }
        stage('Test') {
            agent {
                docker {
                    image 'qnib/pytest'
                }
            }
            steps {
                sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
        stage('Manual Approval') {
            steps {
                input message: 'Lanjutkan ke tahap Deploy?'
            }
            
        }
        stage('Deploy') {
            agent any
            steps {
                sh 'docker build -t my-python-app .'
                sh 'docker run -d -p 8080:8080 --name my-python-app-container my-python-app'
            }
        }
        stage('Wait for 1 minute') {
            agent any
            steps {
                sh 'sleep 60' // Jeda eksekusi selama 1 menit
                sh 'docker stop my-python-app-container && docker rm my-python-app-container'
            }
        }
    }
}

