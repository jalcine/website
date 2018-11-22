---
layout: post
title: "I'm Working on a New Engine for My Site"
byline: I'm going to leave Jekyll for something I built all for me!
excerpt: Jekyll's going to be deprecated for me soon. Long live Koype!
date: 2018-10-12 12:38:52 PDT
syndication:
  - https://playvicious.social/@jalcine/100884460222294662
category: updates
tags:
  - indieweb
  - projects
  - social media
---

In [my last entry][1], I spoke a bit about my slight confusion with the state of
the Web as it is today. I also highlighted a bit on my confusion on the state of
affairs for writing entries for my personal site. I want something that works
particularly to _my_ needs but also be extensible. A (non-exhaustive) list of
items I'd want my website to handle follows:

**[WebMention][] support**
: WebMentions are a modern form of pingbacks for the Web. I'd want my site to
  handle the parsing, formatting and statistical aggregate of information when
  it comes to handling WebMentions. It'll slightly eliminate my need to look
  into using things like [Isso][] for handling comments - the act of replying
  could be on any place you find the post in question!

**[MicroPub][] extensibility**
: MicroPub is a specification that makes the act of handling content on one's
  site as straightforward as consuming a resource using a REST API with
  a sprinkle of authentication. Something like this will allow me to make edits
  to my site on the fly with little effort from services that supports it!

With these two alone, I'd have something I can post from anywhere (namely the
[Indigenous Android client][2]) and even ween off using other "first-party"
clients to handle and interact with people. I've been working on this on the
side for a few weeks now but a considerable amount of progress has been made.
I have a rolling demo of it at [`nextgen`][3]. This is one of those projects
where it's a bit difficult to just _explain_ but a lot easier to just show.

So I'll do that. Once it's in a good place, that is.

[webmention]: https://webmention.io/
[micropub]: https://micropub.rocks/
[isso]: https://posativ.org/isso/
[1]: {% post_url 2018-09-22-where-will-social-media-blogging-take-us %}
[2]: https://indigenous.abode.pub/
[3]: https://nextgen.jacky.wtf/
