---
layout: post
title: My Commitment to the IndieWeb and Free Web
date: 2018-12-02 01:38:07 PST
category: updates
excerpt: |
  My ongoing commitments to the open social Web in the close of 2018
  and onward.
tags:
  - indieweb
  - fediverse
syndication:
  - https://playvicious.social/@jalcine/101173672961099316
---

As the year comes to a close, it's tradition in the [IndieWeb][] to give
some points on reflecting as to what they've managed to accomplish in the
year, what they plan to close the year out with and what the next one
might bring. For me, my push to [work to Koype][1]{: .u-reply-to} has consumed a lot of
my time and pulled me away from making changes to my personal site to help
it more indie. That's okay - I plan to move all of my content over to
a instance of Koype in the near future once the features needed for it
exist. So I'll be taking a bit of a twist here and going into some light
detail into what I want to do going forward in relation to Web projects.

{% oembed https://playvicious.social/@jalcine/101173080249359322 %}

## Building a Home

My goal with Koype, over time, has become more and more resembling that of
Wordpress's own: to be a malleable platform that allows users to craft
experiences for people. Wordpress is known for its simple install
approaches and its ability to run anywhere and everywhere. However, for
the case and purposes I wanted to work within; Wordpress for a website
engine felt too familiar. Thus, [Koype][] came to be.

[Koype][] is my take on building a website - or rather, an application
that serves a multitude of [Microformats 2][2]-backed content to users in
a flexible and extensible manner. It's meant to be a low-maintenance,
high-frill(!) platform for anyone to pick up and use as their "identity"
on the Web. The original idea for making such a platform came from
eyeballing [Manton's][3]{: .u-tag-of} hosted service [micro.blog][] and
how it provides a lean service (on mobile, desktop and Web) for anyone to use.

I'm working on it heavily on my [personal Git server][2] and got a set of
goals lined up for my "switch" - when I deem it ready to move from
<https://v2.jacky.wtf> to <https://jacky.wtf>. You can find the [milestones
there as well][4].

## Building a Window

{% oembed https://playvicious.social/@jalcine/101173087515470050 %}

In hopes of making my use of federated social media a bit more _serious_,
I'm working on implementing a ActivityPub client for the desktop. I've seen
a lot of them using Electron, which ended up being light wrappers around the
website itself. This felt super counter-intuitive to me and gave up a lot of the
features that native environments can provide for users. I've named it [ActivityDesk][4]
for now and will be producing mockups of it when possible.

[ActivityDesk][4] is specific to ActivityPub sites. However, Koype itself would
not immediately support ActivityPub. In a later version, I plan to provide [MicroSub][]
plumbing (that is - allow you to define what external services for MicroSub you'd like)
so that you can use it transparently with other platforms. This is the last leg in truly
being able to step out of [silos][] and renaming both what you follow and what you produce.
I'm particularly excited for that step in the process!

## Sharing the Wealth

I'm looking for other projects in the ActivityPub world to help contribute to. Right now,
I've been eyeballing [Mastodon GlitchSoc][5] and [Pleroma][6]. If you have a project in
the space and need an extra hand, let me know! Preferably a F/LOSS project. If you want
dedicated time to look at your project and help you along; hit up <https://black.af> and
let's talk.

One big part of all of this code development and what not is help keeping it _open-core_.
I'm working to keep levels of abstraction on how my desktop client for ActivityPub works
so that eventually a standalone library can be written and used for people to consume in
their own projects. My biggest goal is to see this be a replacement for Twitter 
extensions into open desktop environments like [Plasma][] or [GNOME Shell][]. Stay tuned
for these split-out announcements!

## Looking for Support

A lot of this stuff I do for me but I also do it for people who I see on-line that
want products for them but don't have the immediate resources or know-how to do it.
If you're one of those people, any kind of support is appreciated. It can be just
[following me][follow] or [funding me][pay] to work on these projects.

Following me is a good way to get in touch with me and give me feedback on
the stuff I'm working on. Funding me helps me validate the time and effort I spend
on these projects!

[koype]: https://git.jacky.wtf/indieweb/koype
[indieweb]: https://indieweb.org/why
[micro.blog]: https://micro.blog/
[1]: {% post_url 2018-10-12-building-koype %}
[2]: https://git.jacky.wtf/indieweb/koype
[3]: http://manton.org/
[4]: https://git.jacky.wtf/fediverse/activitydesk
[5]: http://glitch-soc.github.io/
[6]: https://pleroma.social/
[pay]: /pay
[follow]: /subscribe
[microsub]: https://indieweb.org/Microsub-spec
[silos]: https://indieweb.org/silo
[plasma]: https://www.kde.org/plasma-desktop
[gnome shell]: https://wiki.gnome.org/Projects/GnomeShell
