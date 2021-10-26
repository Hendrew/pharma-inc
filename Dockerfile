FROM ruby:3.0.2

ENV NODE_VERSION 14
ENV INSTALL_PATH /home/rails/pharma-inc-api

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN apt-get update -qq
RUN apt-get install -y nodejs postgresql-client libpq-dev locales cmake
RUN npm install -g yarn

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Add a new user to avoid using the root user
RUN useradd -ms /bin/bash rails
USER rails

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile $INSTALL_PATH/Gemfile

RUN gem install bundler
RUN bundle install

COPY . $INSTALL_PATH
