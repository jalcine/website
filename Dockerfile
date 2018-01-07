FROM ruby:2.4.0-alpine

RUN mkdir /app
WORKDIR /app

RUN apk add -U \
  git make gcc python-dev \
  linux-headers musl-dev \
  gsl-dev imagemagick-dev 


COPY . .
