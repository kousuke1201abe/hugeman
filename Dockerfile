FROM ruby:2.6.5-slim

ENV LANG C.UTF-8

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -qq && \
    apt-get install -y git \
                       gnupg \
                       curl \
                       build-essential \
                       default-libmysqlclient-dev

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN curl -SL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*




RUN mkdir /App
WORKDIR /App
ADD Gemfile /App/Gemfile
ADD Gemfile.lock /App/Gemfile.lock
RUN bundle install
ADD . /App
