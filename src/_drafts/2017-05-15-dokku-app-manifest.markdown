---
layout: post
title: Introducing Dokku Application Manifest
date: 2017-05-15 11:27:31 PDT
category: project
tags:
  - dokku
  - docker
  - dokku application manifest
  - side project
  - announcement
excerpt: |
  Dokku is excellent for side projects or client work alike. If
  you're the kind of person who finds themself constantly re-installing
  and building the same system or want a more deterministic approach to
  building your Dokku systems, look no further.
---

I use [Dokku][] to host a bunch of applications on my personal servers. I don't
need them to be readily available around the world but I do want them to be on
the Internet in a remote VPS and also on my Raspberry Pi at home. The thing
I had an issue with was setting up the whole repetition of setting remotes,
pushing, tweaking configurations and what not.

## Introducing Dokku Manifest

The goal of [`dokku-app-manifest`][] is to make the act of setting up a Dokku server
with a bunch of applications as simple as using [Docker Compose][] :wink:. The
configuration looks a bit like:

{% highlight yaml %}
# Sample Dokku Manifest configuration.
# Let's add comments to the site.
---
version: 1
host:
  name: a.test.host
  user: dokku
apps:
  rubby:
    vcs:
      path: git@github.com:heroku/ruby-rails-sample.git
      sha: master
    commands:
      pre:
        - dokku postgres:create rubby
      post:
        - dokku postgres:link rubby $APP_NAME
  comments:
    docker:
      image: wonderfall/isso
      tag: latest
    commands:
      pre:
        - dokku postgres:create comments
      post:
        - dokku postgres:link rubby $APP_NAME
{% endhighlight %}

This would do the work of deploying a Docker container running Isso for
self-hosted comments and the sample Ruby on Rails application provided by
Heroku.

## Why Build This?

I'm moving to a place where I'd want to build an environment for application
projects that require a lot of repeating of setup. My goal with this is to allow
for immediate deployment of applications to one's instance of Dokku with no
hassle. I'm a big fan of automation and I see this as a big step in that
direction.

## What Are Some Things On The Roadmap?

There's quite a bit one could do with this. Some of the things include:

  * Application deployment chaining: ensuring that in order to deploy A and B,
    C has to be deployed on Dokku first. This could be handy if you wanted to
    ensure that your instance of Piwik is up before you deploy any other
    applications.
  * Conditional deployment: I haven't thought it out yet but there's the case of
    needing to conditionally trigger a deploy of an application. Still ironing
    that one out.

Dokku handles a lot of stuff automatically like health checks and the like so
this doesn't need to do a post-deploy check of sorts.

---
Visit the [project page][`dokku-app-manifest`] for more information.

[dokku]: https://dokku.io
[`dokku-app-manifest`]: https://jacky.wtf/projects/dokku-app-manifest/
[docker compose]: https://docs.docker.com/compose/
