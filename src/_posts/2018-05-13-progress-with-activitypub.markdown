---
layout: post
title: Cramming My ActivityPub Project
date: 2018-05-13 18:30:11 PDT
category: updates
tags:
  - json-ld
  - activitypub
  - projects
excerpt: |
  I made some progress with my C++ library for parsing and handling ActivityPub
  components. All on camera!
---

Earlier today, I [livestreamed another session of me][1] working on ActivityPub
libraries. The goal of this is to make it easier for me to eventually build in
this functionality to a native desktop experience. I still enjoy having that
experience! It's also an exciting time as I get to spend time parsing a W3C
document and attempting to implement from what I read online.

So far, [the repository][2] has the following things "implemented":

  * JSON-LD parsing of documents
  * Validation of the core ActivityStream 'Object'.

I use "implemented" because these things are not 100% to the spec and they need
more tests. As all software could use. Or deleting lines of code. I forget which
one it was.

That said, I do hope that by the end of the quarter, we'd not only having
a working implementation but a simple debugging tool that one could use to parse
a URI that points to JSON and extract structured information from it.

## What's the Point of this Again?
Oh, yeah. So the goal of this library is to do a few things:

  * implement a client for the [KDE][] platform to interact with ActivityPub-compat
    sites
  * create an Akonadi extension that allows for meta-data about
    ActivityPub-associated contacts to appear in my e-mail.

That's some preliminary stuff. I know that it's hyper personal to me but truly,
once I can close a few Web browsing windows, the better :grinning:. I might be
spending less and less on it though, I'm working on making May 2x better than
[January in terms of my fitness goals][3].

Let's get it.

[1]: https://www.twitch.tv/videos/261091485
[2]: https://git.jacky.wtf/indieweb/libactivitypub
[3]: {% post_url 2018-01-27-a-different-january  %}
[kde]: https://www.kde.org/
