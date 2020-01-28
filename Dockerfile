# Base image
FROM ruby:2.5.7
# Plugins
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev vim
# install node js
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - &&\
  apt-get install -y nodejs 
# Set an environment variable where the Rails app is installed to inside of Docker image
ENV RAILS_ROOT /metastore
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT
# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production' 
# copy gemfile
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
# Adding gems
RUN gem install bundler -v 2.0.2
# RUN gem update --system
RUN bundle install 
RUN gem update --system
# Adding project files
COPY . .
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
