node {
    def pythonImage = docker.image('python:3.9-slim')

    // Pull Docker image jika belum ada
    pythonImage.pull()

    stage('Build') {
        pythonImage.inside('-v $WORKSPACE:/app -w /app') {
            sh 'pip install -r requirements.txt'
        }
    }

    stage('Test') {
        pythonImage.inside('-v $WORKSPACE:/app -w /app') {
            sh 'pytest tests/'
        }
    }
}