pipeline {
    agent { docker 'ruby:2.3' }
    stages {
        stage('Building and Running Dependencies') {
            steps {
            	sh 'apt-get update && apt-get install -y nodejs postgresql postgresql-contrib'
                sh 'postgres -v'
                sh 'psql -c "CREATE USER admin WITH PASSWORD \'admin\';"'
                sh 'gem install bundler'
                sh 'bundle install'
                sh 'mkdir -p build/'
                sh 'rm -rf build/*'
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
        		sh 'git archive --format=tar ${GIT_COMMIT} --output=build/dashboard-site.tar'
        		sh 'cp Dockerfile build/'
        	}
        }
    }
    post {
        always {
            archive 'rspec_results.html'
            archive 'build/**/*'
        }
    }
}