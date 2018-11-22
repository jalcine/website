---
layout: post
title: A November Status Update of Koype
date: 2018-11-21 13:17:43 PST
excerpt: |
  I've gotten some baseline IndieWeb-adjacent features working in Koype and I'm
  eager to work on a few more!
category: koype
tags:
  - indienews
  - indieweb
  - koype
---

It's been about a month since I've [last written about Koype][1]. I've managed to
get a few features hashed out; namely support for [Micropub][] and decent
[Microformats2][] rendering of said entries.

## What's Working So Far

I'm working on hashing out some cleaner rendering of the posts but so far; 
they look "operationally useful":

{% asset posts/koype-nov-post.png %}

That's the rendering of a blog post written using [Quill][] by [Aaron][2]. Below
is me using Quill again to make a comment about a photo I've uploaded to the
demonstrative site.

{% asset posts/koype-nov-photo.png %}

The nifty thing about all of this is that when wired together, I can use tools
like [OwnYourGram][] to back feed all of my [Instagram posts][3] to this site;
[OwnYourSwarm][] to pull all of my check-ins and maybe even use FitBit's
flexible API to synchronize my fitness information to a place that I own and can
use whenever and however I please! All of this is possible due to [Micropub][]
being supported.

### IndieAuth Support
Currently, I've only supported [IndieAuth][] in a provider sense for Koype. It
gives it some extra features like remembering if a particular service was
already attempting to log in for these permissions.

I did wish I could have a more concrete sense of reference as to what each
permission could allow an application to do with Koype but there isn't something
like this on the IndieWeb wiki. It's perhaps because this is something that
could be slightly different on a site-by-site basis where it'd be problematic.

## Ambitions

I'm still ironing out some work with MicroPub support in Koype. I also want to
begin looking at logic for generating feeds for the site on a tag-by-tag basis
so it'd be a lot easier for people to subscribe to the platform in
a conventional manner. Silos like [Feedly][] could just find stuff to hook into
this site via ATOM. I don't know if I'll be immediately aiming to support RSS
but tools like Granary makes it so I don't have to immediately implement it
in-house; I can off-load until it becomes something I have to change.

I'm also interested into building [WebMention][] support for Koype. I think I'll
work on using the hosted WebMention service at <https://webmention.io> to see how
it'd place in the grand scheme of things. Luckily WebMention makes it very
simple to handle a lot of the logic and processing work. 

---

I'm excited to continue this project into 2019 and have it ready for people to
start using and moving out of silos and into their own identities on the Web!

[1]: {% post_url 2018-10-12-building-koype %}
[2]: http://aaronparecki.com/
[3]: https://instagram.com/jackyalcine
[micropub]: https://www.w3.org/TR/micropub/
[microformats2]: http://microformats.org/wiki/microformats2
[quill]: https://quill.p3k.io
[ownyourgram]: http://ownyourgram.com/
[ownyourswarm]: http://ownyourswarm.p3k.io/
[indieauth]: https://indieauth.net/
[feedly]: https://feedly.com
[webmention]: https://webmention.net/draft/
