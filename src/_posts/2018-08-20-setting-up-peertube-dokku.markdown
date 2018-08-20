---
layout: post
title: "Setting up PeerTube on Dokku in One Go"
date: 2018-08-20 03:19:51 PDT
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
[PeerTube][]'s name comes from a play on words - it being YouTube, the Google-backed
company that serves millions of videos and the peer in P2P technologies (Peer to
Peer). It makes use of things like BitTorrent and WebRTC to make the act of
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
figure out something obscure about PeerTube. You can't explictly define the name
of the database that it'd use - only the custom suffix to the hardcoded name of
`peertube`. This means you'll have to do the following:

```
$ dokku postgres:connect foxy
postgres#= CREATE DATABASE peertube_prod;
postgres#= \c peertube_prod;
peertube_prod#= CREATE EXTENSION unaccent;
peertube_prod#= CREATE EXTENSION pg_trgm;
```

Thankfully, PeerTube makes use of a configuration system that follows the [12
Factor approach][5] to application development.

{% oembed https://video.jacky.wtf/videos/watch/20a8e663-c4fd-4410-829a-b08545665e1f % }

[1]: https://git.jacky.wtf/me/website
[2]: https://github.com/dokku/dokku-postgres.git
[3]: https://github.com/dokku/dokku-redis.git
[4]: https://github.com/dokku/dokku-letsencrypt.git
[dokku]: http://dokku.viewdocs.io/dokku/
[fediverse]: https://en.wikipedia.org/wiki/Fediverse
[peertube]: https://joinpeertube.org/en/
