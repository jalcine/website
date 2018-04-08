# vim: set fdm=marker foldmarker={{{,}}}

FROM node:9-alpine as node-builder
# {{{

RUN mkdir -p /app/src
ADD src/package* /app/src/
WORKDIR /app/src
RUN npm install --verbose

# }}}

FROM ruby:2.5.1-alpine as jekyll-builder
# {{{

RUN mkdir -p /app/.cache
WORKDIR /app

RUN apk add -U \
  git make gcc \
  python-dev \
  linux-headers \
  musl-dev \
  gsl gsl-dev \
  imagemagick-dev \
  build-base \
  nodejs

ADD Gemfile* /app/

RUN gem install --update bundler execjs && \
    bundle install --binstubs --deployment

ADD . /app
COPY --from=node-builder /app/src/node_modules/ /app/src/node_modules

RUN bin/rake build:prod notify
# }}}
# {{{
FROM nginx:stable-alpine

COPY --from=jekyll-builder /app/_deploy /usr/share/nginx/html

EXPOSE 80

RUN ["nginx"]
# }}}
