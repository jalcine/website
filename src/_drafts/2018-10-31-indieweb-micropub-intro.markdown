---
layout: post
title: "How I Plan to Use MicroPub for Koype"
date: 2018-10-31 10:39:14 PDT
tags:
  - indieweb
  - micropub
  - koype
excerpt: |
  As I build out Koype, I'm aiming to adhere to the specifications provided by
  the MicroPub specification to give users _absolute_ control around how they
  produce content.
---

As I work on [my project for independent blogging][1], I'm being particularly
keen to ensure that it's following a few conventions that can insure its
usefulness for individuals as well as organizations. Despite Koype being
tailored for a single-tenant approach currently, I do want to consider expanding
to allow for more social intents. This is where the concept of [MicroPub][]
comes in.

## What is MicroPub?

[MicroPub][] is a specification that outlines a few things for Web developers:

  * crafting an endpoint that allows for manipulation of a site's posts
  * handling media (image, video, etc) for the site
  * manipulating what kind of actions can occur for posts

> The astute reader would look and ask "well, what about [MetaWeblog][]?" Well,
> I can't think of many clients that _directly_ support [MetaWeblog][]. It's more
> likely that they'd support the [Atom Publishing Protocol][app] or use
> a proprietary content management system like [Craft CMS][1] or the likes.

[micropub]: https://www.w3.org/TR/micropub
[metaweblog]: https://en.wikipedia.org/wiki/MetaWeblog
[app]: https://en.wikipedia.org/wiki/Atom_(standard)
[1]: https://craftcms.com/
