---
layout: post
title: Defining Applications for Dokku using Dokku Manifest
date: 2017-05-15 11:27:31 PDT
category: project
tags:
  - dokku
  - docker
  - dokku manifest
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
pushing, tweaking configurations and not.

## Introducing Dokku Manifest

The goal of [`dokku-manifest`][] is to make the act of setting up a Dokku server
with a bunch of applications as simple as using [Docker Compose][] :wink:. The
configuration looks a bit like:

{% highlight yaml %}
# Sample Dokku Manifest configuration.
# Let's add comments to the site.
---
version: 1
host: magic.host
apps:
  comments:
    vcs:
      path: https://github.com/posativ/issos
      commit:  master
{% endhighlight %}

I got a little demo working over on my [personal Git server][1]. Once I get it
into a decent state, I'll clone it over to Github for more people to toy with.

[dokku]: https://dokku.io
[`dokku-manifest`]: https://jacky.wtf/projects/dokku-manifest/
[docker compose]: https://docs.docker.com/compose/
[1]: https://git.jacky.wtf/
