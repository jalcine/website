---
layout: post
title: I'm Working on a C++ Library for JSON-LD
date: 2018-05-04 23:30:35 PDT
excerpt: |
  JSON-what? Jacky, why are you writing C++?
category: announcement
tags:
  - indieweb
  - json-ld
  - activitypub
  - activitystream
  - c++
---

A while back, like a _while_ back, I mentioned on one of my [Mastodon][] accounts that
I wanted a [ActivityPub][] client for Linux, namely KDE. Another person on here
mentioned that they've begun working on one for GNOME. Which is great! The whole
ability for people to just ahead and build their own foundational tools and
systems is a big tenant of the [IndieWeb][1]. The thing is, there's not a lot
out there.

In lieu of the emptiness of desktop clients, I decided to start working on
a library that allows people to parse information from an ActivityPub server.
However, in doing some research, I realized that this required some knowledge on
how [ActivityStream][] works. That resulted in me needing to understand
something called [JSON-LD][jsonld].

## The Bottom of the Hole
**JSON-LD** is a pretty interesting extension (or reimplementation) of this
thing called [RDF][] on top of JSON. A lot of stuff and acronyms. In
a very quick description, it's a way of taking data that lacks
machine-processable context and giving it contextual information that
machines can do more with. Currently, with the implementation I have over
[git.jacky.wtf][], we can take in a JSON string and pull out the
accompanying context.

## Watch Me!

I wrote what's available there in a sampling of time over a live video on
Twitch. Check out the next time I'm doing it [via this event][2]. I'll
keep y'all in tune with more changes.

[1]: /faq/indieweb/
[2]: https://www.twitch.tv/events/qTG8p3gjTLarW9mV_qI2Vw
[activitypub]: http://activitypub.rocks/
[activitystream]: https://www.w3.org/ns/activitystreams
[jsonld]: https://www.w3.org/TR/json-ld/
[rdf]: https://duckduckgo.com/?q=rdf&atb=v115-2_f&ia=web
[mastodon]: /faq/mastodon/
[git.jacky.wtf]: https://git.jacky.wtf/indieweb/libactivitypub
