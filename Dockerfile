FROM ruby:2.3
MAINTAINER ronierison.silva@gmail.com

RUN apt-get update && apt-get install -y \
  	build-essential \
  	nodejs

RUN mkdir -p /opt

WORKDIR /opt/dashboard-site

COPY dashboard-site.tar .

RUN tar -xf dashboard-site.tar

RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

RUN RAILS_ENV=production rake db:migrate

COPY . ./

EXPOSE 80

CMD ["bundle", "exec", "puma", "-p", "80", "-e", "production"]