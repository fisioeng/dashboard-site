FROM ruby:2.3
MAINTAINER ronierison.silva@gmail.com

RUN apt-get update && apt-get install -y \ 
  	build-essential \ 
  	nodejs

RUN mkdir -p /opt

RUN git clone https://github.com/fisioeng/dashboard-site.git

WORKDIR /opt/dashboard-site

COPY Gemfile Gemfile.lock ./ 
RUN gem install bundler 
RUN bundle install --jobs 20 --retry 5

COPY . ./

EXPOSE 80

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "80"]