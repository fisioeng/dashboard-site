pipeline {
    agent { docker 'ruby' }
    stages {
        stage('Building Dependencies') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install'
            }
        }
        stage('Running Rspec') {
        	steps {
        		sh 'rspec'
        	}
        }
        stage('Saving Tests Results') {
        	steps {
        		sh 'rspec --format html --out rspec_results.html'
        	}
        }
        stage('Saving Build Version') {
        	steps {
        		sh "git archive --format=tar master | gzip > dashboard-site-$BUILD_NUMBER.tar.gz"
        	}
        }
    }
    post {
        always {
            archive 'rspec_results.html'
            archive 'Dockerfile'
            archive "dashboard-site-$BUILD_NUMBER.tar.gz"
        }
    }
}