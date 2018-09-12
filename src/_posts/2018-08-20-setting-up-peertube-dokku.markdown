---
layout: post
title: "Setting up PeerTube on Dokku in One Go"
date: 2018-08-20 03:19:51 PDT
syndication:
  - https://playvicious.social/@jalcine/100583120598291163
  - https://video.jacky.wtf/videos/watch/20a8e663-c4fd-4410-829a-b08545665e1f
category: guides
tags:
  - dokku
  - peertube
  - federation
excerpt: |
  In this post, I give some notes and a recap of a live stream I did around
  setting up PeerTube on my personal Dokku server.
---

I'm an avid user of [Dokku][] for running a bunch of different applications on
my server. This website itself is served using [a Dokku application][1]. In lieu
of me wanting to continue to move my content and identity into the
[Fediverse][], I began looking into video hosting solutions that I could use to
run and share on my own system. In came [PeerTube][].

# What is PeerTube?
The word [PeerTube][] comes from a play on words - it being YouTube, the Google-backed
company that serves millions of videos and the peer in P2P technologies (Peer to
Peer). It makes use of things like Bit Torrent and Web RTC to make the act of
sharing videos across the Web more on-demand and push-centric versus the model
we have today.

# Setting up Dokku
Before we begin, I'm making the assumption that you have the [postgres][2],
[redis][3] and [letsencrypt][4] plugins installed on your host machine. If you
don't, you can install them by running the following:

```
$ sudo dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres
$ sudo dokku plugin:install https://github.com/dokku/dokku-redis.git redis
$ sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git letsencrypt
```

From here, we can go ahead and download the Docker image for PeerTube:

```
$ docker pull chocobozzz/peertube 
```

In this demo, we'll name our application `foxy`. Go ahead and set up a new
application as well as linking some new data containers to `foxy`.

```
$ dokku postgres:create foxy
$ dokku redis:create foxy
$ dokku apps:create foxy
$ dokku postgres:link foxy foxy
$ dokku postgres:link foxy foxy
```

Cool. So I spent about six minutes (as shown in the video below) attempting to
figure out something obscure about PeerTube. You can't explicitly define the name
of the database that it'd use - only the custom suffix to the hard coded name of
`peertube`. This means you'll have to do the following:

```
$ dokku postgres:connect foxy
postgres#= CREATE DATABASE peertube_prod;
postgres#= \c peertube_prod;
peertube_prod#= CREATE EXTENSION unaccent;
peertube_prod#= CREATE EXTENSION pg_trgm;
```

Thankfully, PeerTube makes use of a configuration system that follows the [12
Factor approach][5] to application development. That makes this next step a lot
of fun! We'll load up the application instance with configuration options:

```
$ dokku config:set foxy \
  PEERTUBE_ADMIN_EMAIL='yo+video@jacky.wtf' \
  PEERTUBE_ADMIN_EMAIl='video@jacky.wtf' \
  PEERTUBE_DB_HOSTNAME='dokku-postgres-video' \
  PEERTUBE_DB_PASSWORD='0c420a12d87896d043e62a5fdfaec368' \
  PEERTUBE_DB_SUFFIX='_prod' \
  PEERTUBE_DB_USERNAME='postgres' \
  PEERTUBE_REDIS_AUTH='2cfb07545e7660fe11196f46959bd72937083180d6c232123466525a5f19e62d' \
  PEERTUBE_REDIS_HOSTNAME='dokku-redis-video' \
  PEERTUBE_SIGNUP_ENABLED='true' \
  PEERTUBE_SMTP_FROM='yo+video@jacky.wtf' \
  PEERTUBE_SMTP_HOSTNAME='smtp.host' \
  PEERTUBE_SMTP_PASSWORD='smtp.pass' \
  PEERTUBE_SMTP_PORT='587' \
  PEERTUBE_SMTP_USERNAME='apikey' \
  PEERTUBE_TRANSCODING_1080P='true' \
  PEERTUBE_TRANSCODING_240P='true' \
  PEERTUBE_TRANSCODING_360P='true' \ 
  PEERTUBE_TRANSCODING_480P='true' \
  PEERTUBE_TRANSCODING_720P='true' \
  PEERTUBE_TRANSCODING_ENABLED='true' \
  PEERTUBE_TRANSCODING_THREADS='8' \
  PEERTUBE_WEBSERVER_HOSTNAME='foxy.jacky.wtf' \
  PEERTUBE_WEBSERVER_HTTPS='true'
```

You should see the following (or something similar) when you attempt to deploy
the application with `dokku deploy`:

```
$ dokku deploy foxy
-----> Releasing foxy (dokku/foxy:latest)...
-----> Deploying foxy (dokku/foxy:latest)...
-----> Attempting to run scripts.dokku.predeploy from app.json (if defined)
-----> No Procfile found in app image
-----> DOKKU_SCALE file found (/home/dokku/foxy/DOKKU_SCALE)
=====> web=1
-----> Attempting pre-flight checks
       For more efficient zero downtime deployments, create a file CHECKS.
       See http://dokku.viewdocs.io/dokku/deployment/zero-downtime-deploys/ for examples
       CHECKS file not found in container: Running simple container check...
-----> Waiting for 10 seconds ...
-----> Default container check successful!
-----> Running post-deploy
-----> Found previous container(s) (d44dad939469) named foxy.web.1
=====> renaming container (d44dad939469) foxy.web.1 to foxy.web.1.1534775446
=====> renaming container (09e5c27eea57) musing_curran to foxy.web.1
-----> Configuring foxy.jacky.wtf...(using built-in template)
-----> Creating https nginx.conf
-----> Running nginx-pre-reload
       Reloading nginx
-----> Setting config vars
       DOKKU_APP_RESTORE:  1
-----> Attempting to run scripts.dokku.postdeploy from app.json (if defined)
-----> Shutting down old containers in 60 seconds
=====> d44dad939469cf6912b1c55876c9b646100362268c072b33397265c99adf6e54
=====> Application deployed:
       https://foxy.jacky.wtf
       http://foxy.jacky.wtf
```

# Closing Thoughts
With this, you'll have PeerTube up and running. I have a video of me setting
this up in real time below on my personal instance. I didn't find the
documentation extremely helpful when I was setting this up. Also, the notion of
a Web server here is a bit weird because if you used a reverse proxy like me,
you'd be considering your proxy the web server. It didn't immediately click for
me but I've outlined that above with the `PEERTUBE_WEBSERVER_*` options.
Depending on the processing speed and the number of threads you've allowed
PeerTube, the availability of your videos could be anywhere from mere seconds to
an hour - be sure to consider that.

{% oembed https://video.jacky.wtf/videos/watch/20a8e663-c4fd-4410-829a-b08545665e1f %}

[1]: https://git.jacky.wtf/me/website
[2]: https://github.com/dokku/dokku-postgres.git
[3]: https://github.com/dokku/dokku-redis.git
[4]: https://github.com/dokku/dokku-letsencrypt.git
[5]: https://12factor.net/config
[dokku]: http://dokku.viewdocs.io/dokku/
[fediverse]: https://en.wikipedia.org/wiki/Fediverse
[peertube]: https://joinpeertube.org/en/
