---
layout: post
title: My Commitments to the IndieWeb in 2018
date: 2018-05-11 14:15:02 PDT
category: updates
tags:
  - indieweb
  - goals
---

I've been really pushing to get my platform (which is _practically_ there)
to be more [IndieWeb][] adjacent. With every ambition, one needs to set
a few goals. This post will serve as a way for me to measure and set those
goals!

## Make WebMentions "Native"

Currently, my [statically generated site][1] supports both [traditional
comments][2] and kind of supports [WebMentions][3]. WebMention logic looks
a bit like this:

![How WebMentions look.]({% asset posts/webmention-classic.png @path %})

Now, that same set of WebMentions look like this:

![How WebMentions look now.]({% asset posts/webmentions-new.png @path %})

So much better now!

## Work on Libraries and Apps
I use a bit of a [unconventional system][4] as my daily driver. That said, 
having a native client for my machine to interact with the IndieWeb
would make my life a lot easier. On top of working on an [ActivityPub][5]
library that other applications can build on top of, I think I'll be
moving into seeing if I can work on making a live posting / streaming
client for my site. Something to ponder.

[indieweb]: https://indieweb.org/
[1]: {{ site.url }}/faq/about-website/
[2]: {{ site.url }}{% post_url 2018-04-07-comments-are-back %}
[3]: {{ site.url }}{% post_url 2018-05-09-getting-more-indie %}
[4]: {{ site.url }}/gear/#operating-system
[3]: {{ site.url }}{% post_url 2018-05-04-library-jsonld-activitypub %}
