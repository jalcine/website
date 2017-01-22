---
layout: post
title: Getting Nextcloud Running on Dokku
date: 2017-01-11 20:07:13 PST
category: infrastructure
tags:
  - dokku
  - nextcloud
  - infrastructure
excerpt: |
  As part of my attempt to get my infrastructure up and running smoothly, I’ve
  been looking into getting Nextcloud running on Dokku with ease, stability and
  reproducibility. Let’s see how this works out.

---

[Nextcloud][] is a clutch PHP-based platform for handling your personal “office”
needs. Things like storing files, contacts and your calendar can all be done
from this central spot. If that doesn’t make too much sense, understand that I’m
looking to [go indie][1]. I’m aiming to get a few things running on this
instance of Nextcloud but let’s see how we can get up and running on Dokku.

## Futzing Around With Images
The thing about [Dokku][] that makes it fun and a bit annoying is that the
_simplest_ form of deployment is via Git. Deployment with Dokku is kicked off
with something like this:

{% highlight shell %}
$ git remote add dokku dokku@dokku.magic.host
$ git push dokku master
{% endhighlight %}

Very simple and straight forward! Now, with Nextcloud, there’s a few things to
consider:

### I Want Apps
There’s a suite of applications I’d like to have _pre-installed_ when I launch
this instance of [Nextcloud][]. They include things like bookmark support and  SMS
synchronization. How would I go about ensuring these are installed into the
image?

### No Downtime for Configuration
I also want to make sure that the configuration between up-time windows is safe.
That shouldn’t be too hard to handle with volumes.

### Data is Intact and Transparently Encrypted
I make use of LUKS to keep my files safe in the cloud. The thing is, the data
used here wouldn’t be immediately mapped to my LUKS storage - it’d be saved to
the Docker directory for containers and volumes - `/var/lib/docker`.

This is something I haven’t yet figured out and will write about in a future
post when I do. For now, we’ll leave this as is.

## Building the Image
I began looking around to see if anyone’s already gotten some headway into
getting this going. I also kept examining the documentation regarding the
deployment of applications via Dockerfiles. It looks like that taking that
approach might actually put me at a disadvantage with regards to all of the
features that buildpack-powered applications may gain. I decided to put my need
to have them launched in such a fashion due to the acceptance that Dokku is
really just a Docker container manager - mapping host names and ports to
processes running on the server.

That rationale led me to the path of just cloning and pushing versions of code
to Dokku itself.

[1]: {% post_url 2017-01-08-pulling-thangs-in-haus %}
[2]: http://magic.com
[nextcloud]: https://nextcloud.org
[dokku]: http://dokku.viewdocs.io/dokku/
