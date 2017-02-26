---
layout: post
title: Stop Writing Tests For MVPs
date: 2017-02-25 23:42:30 PST
category: rants
tags:
  - testing
  - mvp
  - side project
excerpt: |
  I’ve attempted to work on a few side projects for close to a year now. The
  biggest roadblocks weren’t prototyping interfaces or hammering out user
  feedback. It was always around me attempting to debug and capture test cases
  that didn’t exist.

---

So I’ve recently soft-launched [something][1]. It’s far from complete. Actually,
that version of the page is the fourth attempt. I definitely suffer from a bit
of perfectionism but recently, I’ve really unlocked something when speaking with
friends. Two of them, [Iheanyi][] and [Reggie][] really spelled it out for me:
**stop writing tests**. This was specifically in the context of working on
software that hasn’t even seen the public eye.

I kept writing test after test, mock after mock, for things I wasn’t 100% sure
that I’d be using in production. That was the true kicker[^1]; that I wasn’t
even _sure_ that what I was testing was even going to affect the user!

No more, I say! No MORE!

[iheanyi]: https://iheanyi.com
[reggie]: https://twitter.com/itsnotreggie
[^1]: This is also the true moral of this post.
[1]: http://www.twch.at/
