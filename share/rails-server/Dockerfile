FROM ruby:2.5.3
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev
RUN /bin/bash -c "curl -sL https://deb.nodesource.com/setup_9.x | bash  - " &&\
    apt-get install -y nodejs npm && \
    npm install -g yarn
RUN mkdir -p /usr/src/rails-server
WORKDIR /usr/src/rails-server
ADD Gemfile /usr/src/rails-server/Gemfile
ADD Gemfile.lock /usr/src/rails-server/Gemfile.lock
RUN bundle install