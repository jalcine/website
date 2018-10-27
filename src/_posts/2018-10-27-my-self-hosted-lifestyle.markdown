---
layout: post
title: "My Self-Hosted Lifestyle"
date: 2018-10-27 08:09:37 PDT
category: review
tags:
  - dokku
  - nextcloud
  - peertube
excerpt: |
  I've been hosting a lot of services that I used to rely on corporations to
  handle for me on my own server. It's been way faster, reliable and enjoyable
  for me.
---

For some time now, I've moved a lot of stuff that's part of my personal routine
into my personal server. [After rebuilding Kandor][1], my personal server's
layout; I took to adding a few services that I'd find useful.

## Nextcloud

I use [NextCloud][] to handle a lot of things that Google's cloud file suite
would offer. I don't have collaborative documents - I don't really use that
anymore. Nor do I handle my e-mail; Google handles it well. I [don't agree that
centralized email services are better][2] since it goes against what email is
meant to be.

{% asset "posts/Screenshot_20181027_090748.png" class="db w-100 h-auto" %}

The login screen is mundane, nothing really special. I have my instance set up
with a few more steps for security reasons so I can use it comfortably from
anywhere I'd like. Once I'm in, I can see the stuff I got lying around.

{% asset "posts/Screenshot_20181027_091013.png" class="db w-100 h-auto" %}

This reflects the layout I use in my top-most directory on my host machine.
I link a few of the folders over so it's a seamless experience for me whenever
I manipulate files on my system. New screenshots? Uploaded. Downloaded a new PDF
or ePub for reading on my tablet? Synced in a few moments to NextCloud and
down to my device.

{% asset "posts/Screenshot_20181027_091225.png" class="db w-100 h-auto" %}

A lot of the tasks and actions one takes can be reviewed in the "Activity" app
window. Since it's only me on this instance, this feed tends to be a soft audit
log for my personal use. It's nice to see and check in - especially if I'm too
lazy to open the app and see what's synced; I occasionally just pop this open.

{% asset "posts/Screenshot_20181027_091435.png" class="db w-100 h-auto" %}

One of the applications within NextCloud I like using a lot is the "Notes" app.
It's ironic since I really only use it for viewing stuff on the Web. If I'm out
or not in the mood to use my automatic note taking setup in NeoVim, I pop this
open and begin typing away! Having it automatically handle things like lists and
headings makes it a daily driver for me.

{% asset "posts/Screenshot_20181027_091743.png" class="db w-100 h-auto" %}

Out of all of the services within NextCloud that I use the most, the news
reading application is definitely _way_ up there. Not only can I handle
RSS and ATOM feeds in here; I can handle my podcast subscriptions. This
makes it very easy for to just pop some in when I'm on my way to the gym,
cooking or just working on the computer and don't want music in my ears.

All of these things from NextCloud as well as its ability to extend are
things that keep me tethered to the service. I used to use OwnCloud prior
to the forking. NextCloud has managed to keep the quality of service and
software high without compromising on performance.

## Wallabag

[Wallabag][] is a super-simple, "do one thing right" kind of application.
With a few browser extensions, it ingests URIs (link to blogs or what have
you) and turns them into more simpler reading formats for later use. This
is something I've done a lot but didn't want to send out to other services
to track and manipulate how I use and read information on the Web.

{% asset "posts/Screenshot_20181027_092344.png" class="db w-100 h-auto" %}

There's not much more to say about this application. On Android, namely my
tablet, I can read through my entries like flicking through pages of
a newspaper when I'm at home, on the go or just looking to pass time.

## PeerTube

[PeerTube][] is a project funded by the same people behind [Wallabag][].
I've been using it recently in a very exploratory fashion. The bulk of my
uploads are recordings from my live streams or imported videos from
elsewhere on the Internet that I'd like to keep.

{% asset "posts/Screenshot_20181027_093456.png" class="db w-100 h-auto" %}

I have some _sort_ of curation going on. I guess? For now, I've been
opting to keep a lot of the videos in the vein of imported from YouTube
with crediting or something I've crafted myself.

{% asset "posts/Screenshot_20181027_093550.png" class="db w-100 h-auto" %}

## That's All!
I'm aiming to make this post the landing page for a `/hosted` page or
something when I get enough time and handling around things. I try to help
promote self-hosted solutions or just anything that isn't heavily
centralized to promote safety and diversity of the toolkits we have
available on the Web.

[1]: {% post_url 2018-01-18-new-infra %}
[2]: https://www.jeffkee.com/self-hosted-emails-are-dying-out-and-why-they-should/
[nextcloud]: https://nextcloud.org
[wallabag]: https://www.wallabag.org/en/
[peertube]: http://joinpeertube.org/en/
