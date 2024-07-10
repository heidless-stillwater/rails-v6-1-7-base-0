# Use the official Ruby image from Docker Hub
# https://hub.docker.com/_/ruby

# [START cloudrun_rails_base_image]
# Pinning the OS to buster because the nodejs install script is buster-specific.
# Be sure to update the nodejs install command if the base image OS is updated.
# FROM ruby:2.6.3
FROM ruby:3.2-buster
# FROM ruby:3-bullseye
# FROM ruby:2.6.3-slim-buster

# [END cloudrun_rails_base_image]

RUN (curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | gpg --dearmor | apt-key add -) && \
    echo "deb https://deb.nodesource.com/node_14.x buster main"      > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs lsb-release

RUN (curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -) && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

WORKDIR /app

# Application dependencies
COPY Gemfile Gemfile.lock ./

# RUN gem update --system 3.2.3

RUN gem install bundler -v 2.4.22 && \
    bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle install


# Copy application code to the container image
COPY . /app

ENV RAILS_ENV=production
ENV RAILS_SERVE_STATIC_FILES=true
# Redirect Rails log to STDOUT for Cloud Run to capture
ENV RAILS_LOG_TO_STDOUT=true
# [START cloudrun_rails_dockerfile_key]
ARG MASTER_KEY
ENV RAILS_MASTER_KEY=${MASTER_KEY}
# [END cloudrun_rails_dockerfile_key]

# pre-compile Rails assets with master key
RUN bundle exec rake assets:precompile

EXPOSE 8080
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "8080"]
