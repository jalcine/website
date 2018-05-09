---
layout: post
title: I Brought Back Commenting On My Site
date: 2018-04-07 23:05:10 PDT
category: system
tags:
  - infrastructure
  - comments
  - introduction
excerpt: |
  You know, comments _aren't_ so bad. I missed them.
---

As part of my mission to get my website to [align with my digital identity][1],
I've opted to make use of [Isso][] to handle commenting. I've enabled it for
every blog post _and_ to each of the [FAQ](/faq/) pages. This way, I can see
that feedback and fold it back into the site a lot easier. I'm a bit fortunate
since I have my own [infrastructure][2], I can just spin up this service easily.

The goal is to make the act of interacting with my content to be as low-friction
as possible. Consider it a pilot that everyone's opted into! There's definitely
a few things I wish Isso supported like

  * SSO sign in support
  * simpler avatar generation (pulling from auth backend or gravatar/ilk)

The benefits of using an open source, self-hosted-able project is that I can
both [fork it][3] but also run and test said features I'd want and propose
patches if maintainers are interested!

## Looking Towards the IndieWeb

The end goal of this site is to eventually have something that'd look like
what [aaronparecki.com][5] does data-wise. It's going to take
some time to get here and to be frank, I think I might even move the micro
status facet of things to a separate service - that's for another post. For now,
you can catch that kind of content over on [Mastodon][4].

[1]: {% post_url 2017-01-08-pulling-thangs-in-haus %}
[2]: {% post_url 2018-01-18-new-infra %}
[3]: https://git.jacky.wtf/me/isso/
[4]: /subscribe/#social-media
[5]: https://aaronparecki.com/2018/04/01/39/q1-review
[isso]: https://posativ.org/isso/
