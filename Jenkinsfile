pipeline {
    agent { docker 'ruby' }
    stages {
        stage('build') {
            steps {
                sh 'gem install bundler'
                sh 'bundle install --without development test'
            }
        }
    }
}