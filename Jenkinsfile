pipeline {
    agent { docker 'ruby' }
    stages {
        stage('install dependencies') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install --without development test'
            }
        }
        stage('unit tests') {
        	steps {
        		sh 'rspec'
        	}
        }
    }
}