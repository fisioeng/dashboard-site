pipeline {
    agent { docker 'ruby' }
    stages {
        stage('build') {
            steps {
                sh 'sudo yum install -y gcc ruby-devel zlib-devel'
                sh 'gem install bundler'
                sh 'bundle install --without development test'
            }
        }
    }
}