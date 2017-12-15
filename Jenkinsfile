pipeline {
    agent { docker 'ruby' }
    stages {
        stage('Build') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install'
            }
        }
        stage('Tests') {
        	steps {
        		sh 'rspec'
        	}
        }
        stage('Build Docker Container') {
        	steps {
        		sh 'docker --version'
        	}
        }
    }
}