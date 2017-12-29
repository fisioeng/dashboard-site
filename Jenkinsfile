pipeline {
    agent { docker 'ruby' }
    stages {
        stage('Building and Running Dependencies') {
            steps {
            	sh 'gem install bundler'
                sh 'bundle install'
                sh 'mkdir -p build/'
                sh 'rm -rf build/*'
                sh 'sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose'
                sh 'chmod +x /usr/local/bin/docker-compose'
                sh 'docker-compose --version'
                sh 'docker-compose up -d'
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