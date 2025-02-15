node {
    stage('Build') {
        docker.image('python:2-alpine').inside {
            sh 'python -m py_compile sources/add2vals.py sources/calc.py'
        }
    }
    
    stage('Test') {
        docker.image('qnib/pytest').inside {
            sh 'py.test --verbose --junit-xml test-reports/results.xml sources/test_calc.py'
        }
        junit 'test-reports/results.xml'
    }
    
    stage('Manual Approval') {
        input message: 'Lanjutkan ke tahap Deploy?'
    }
    
    stage('Deploy') {
        sh 'docker build -t my-python-app .'
        sh 'docker run -d -p 8080:8080 --name my-python-app-container my-python-app'
    }
    
    stage('Wait for 1 minute') {
        sh 'sleep 60' // Jeda eksekusi selama 1 menit
        sh 'docker stop my-python-app-container && docker rm my-python-app-container'
    }
}
