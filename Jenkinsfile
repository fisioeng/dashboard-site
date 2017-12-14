pipeline {
    agent { docker 'ruby' }
    stages {
        stage('build') {
            steps {
                sh 'apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev'
                sh 'gem install bundler'
                sh 'bundle install --without development test'
            }
        }
    }
}