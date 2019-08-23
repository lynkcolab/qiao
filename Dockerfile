FROM ruby:2.6.1-stretch as base

RUN apt-get update && apt-get install -y \
  git \
  build-essential \
  g++ \
  imagemagick \
  libpq-dev \
  qt4-dev-tools \
  libqt4-dev \
  nodejs

RUN mkdir -p /var/app

ADD Gemfile Gemfile.lock ./

RUN bundle install

FROM base as release

ADD . ./

WORKDIR /var/app

EXPOSE 80

ENTRYPOINT bundle exec rails s -p 80 -b 0.0.0.0