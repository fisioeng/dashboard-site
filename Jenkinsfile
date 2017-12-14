pipeline {
    agent { docker 'ruby' }
    stages {
        stage('install dependencies') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install'
            }
        }
        stage('unit tests') {
        	steps {
        		sh 'rspec'
        	}
        }
    }
}