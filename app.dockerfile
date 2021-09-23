FROM ruby:3.0.2

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y vim nodejs sqlite3 libsqlite3-dev yarn cron && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /app
WORKDIR /app

COPY Gemfile* /app/

RUN gem install bundler && bundle install && \
    bundle config set path 'vendor/cache'
    
COPY . /app

RUN whenever -w
 