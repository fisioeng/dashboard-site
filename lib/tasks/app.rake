require 'rake'

namespace :app do
  desc "Start application and dependencies"
  task start: ['dependencies:start', 'db:create', 'db:migrate'] do
  	puts "Starting application"
  	system "rails s -b 0.0.0.0 -p 3000"
  end

  namespace :dependencies do
	  desc "Start docker dependencies"
	  task :start do
	  	puts "Starting docker dependencies"
	  	system "docker-compose up -d"
	  end

	  desc "Stop docker dependencies"
	  task :stop do
	  	puts "Stopping docker dependencies"
	  	system "docker-compose down"
	  end
	end
 end