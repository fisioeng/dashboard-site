pipeline {
    agent { docker 'ruby' }
    stages {
        stage('Build') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install'
                sh 'mkdir -p build'
            }
        }
        stage('Tests') {
        	steps {
        		sh 'rspec'
        	}
        }
        stage('Save Tests Results') {
        	steps {
        		sh 'rspec --format html --out build/rspec_results.html'
        	}
        }
        stage('Save Build Version') {
        	steps {
        		sh 'git archive --format=tar master | gzip > build/dashboard-site-$BUILD_NUMBER.tar.gz'
        	}
        }
        post {
	        always {
	            archive 'build/**/*.html'
	            archive 'build/**/*.tar.gz'
	        }
	    }
    }
}