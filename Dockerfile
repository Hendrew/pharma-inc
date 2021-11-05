FROM ruby:3.0.2

ENV NODE_VERSION 14
ENV INSTALL_PATH /pharma-inc-api

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN apt-get update -qq
RUN apt-get install -y nodejs postgresql-client libpq-dev locales cmake
RUN npm install -g yarn
RUN apt-get -y install cron

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH/Gemfile

RUN gem install bundler
RUN bundle install

COPY . $INSTALL_PATH
