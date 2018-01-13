# vim: set fdm=marker foldmarker={{{,}}}

FROM node:9-alpine as node-builder
# {{{

RUN mkdir -p /app/src
ADD src/package* /app/src/
WORKDIR /app/src
VOLUME /app/src/node_modules
RUN npm install

# }}}

FROM ruby:2.4.0-alpine as jekyll-builder
# {{{

RUN mkdir -p /app/.cache
WORKDIR /app

RUN apk add -U \
  git make gcc python-dev \
  linux-headers musl-dev \
  gsl-dev imagemagick-dev \
  build-base nodejs

ADD Gemfile* /app/

VOLUME /app/vendor

RUN gem install --update bundler execjs && \
    bundle install --deployment --binstubs

ADD . /app
COPY --from=node-builder /app/src/node_modules ./src/node_modules

RUN ["bin/rake", "build:deploy"]

RUN rm -rvf /app/src/node_modules/

# }}}
# {{{
FROM nginx:stable-alpine

COPY --from=jekyll-builder /app/_deploy /usr/share/nginx/html

RUN ["nginx"]
# }}}
