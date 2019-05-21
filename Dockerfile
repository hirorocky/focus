FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# 最新のnodejsを入手
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash && \
    apt install -y nodejs

RUN gem install bundler
RUN mkdir /src
WORKDIR /src
ADD Gemfile Gemfile

RUN bundle install --without production
RUN bundle install
ENV RUBYOPT -EUTF-8
