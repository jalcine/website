# vim: set fdm=marker foldmarker={{{,}}}

FROM node:9-alpine as node-builder
# {{{

RUN mkdir -p /app/src
ADD src/package* /app/src/
WORKDIR /app/src
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

RUN gem install --update bundler execjs && \
    bundle install --deployment

ADD . /app
COPY --from=node-builder /app/src/node_modules ./src/node_modules

RUN ["bundle", "exec", "jekyll", "build", "--verbose", "--trace"]

RUN rm -rvf /app/src/node_modules/

# }}}
# {{{
FROM nginx:stable-alpine

COPY --from=jekyll-builder /app/_site /usr/share/nginx/html

RUN ["nginx"]
# }}}
