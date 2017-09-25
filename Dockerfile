FROM ruby:2.4.1

RUN mkdir /spotify_api_consumer
WORKDIR /spotify_api_consumer
ADD Gemfile /spotify_api_consumer/Gemfile
ADD Gemfile.lock /spotify_api_consumer/Gemfile.lock
RUN bundle install

