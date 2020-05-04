FROM ruby:2.3.7


RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /ajackus


WORKDIR /ajackus


COPY Gemfile /ajackus/Gemfile
COPY Gemfile.lock /ajackus/Gemfile.lock




RUN bundle install

# Make port 3000 available to the world outside this container

ADD . /ajackus
