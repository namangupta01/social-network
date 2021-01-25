FROM ruby:3.0.0-alpine
RUN apk update && apk add build-base ruby-dev nodejs postgresql-dev linux-headers yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle update
RUN bundle install
RUN rails webpacker:install
COPY . .
#RUN bundle exec rake assets:precompile
