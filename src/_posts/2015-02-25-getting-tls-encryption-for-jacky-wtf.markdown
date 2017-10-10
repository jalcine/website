---

layout: post
category: thoughts
tags:
  - sovereign
  - ssl
  - security
title: "Getting TLS Encryption For jacky.wtf"
date: 2015-02-25 22:31:33 EST
excerpt: |
  TLS certificate set up for <https://jacky.wtf>.

---

Recently I've managed to get `jacky.wtf` and friends to use **TLS 1.2**
encryption for the site. This is personally practice to understand the plight of
setting up SSL on web servers in lieu of the upcoming wide support of [HTTP/2][1].
It's pretty cheap for (up to 3) multi-TLD (multiple top level domains)
certificates over at [Gandi][2]. Sadly though, I didn't think how this would
effect my deployment of services since I've placed [cgit][3] and my other
services at their own sub domains. I can't since this would require a [_wild
card_ certificate][3] and those get expensive ($16 for 3 domain coverage vs $50
for wild card for one domain). I decided to cut my losses[^2] and just stick to
using SSL for `jacky.wtf` (and `jalcine.me`).

I've been working on [getting a set of federated services][3] up and going and
one of the things I did want in system was things like [cgit][3], ownCloud, etc.
working under SSL. For this, it looks like I might end up making my own private
root CA and generating a new certificate for each service I'd want to use. I
can't see too much of an issue with this, outside of repetition ensuing from
generating certificates, but it's a necessary evil since I decided to be cheap.
Also, since it's under my own private CA, it's no real reason for anyone else to
use the service or interact with said applications. Once I get the VPN up and
going, it can just be visible within that space and I wouldn't have to worry
(too much) about using TLS there.

Long live HTTP/2 (hurry up, would ya? :grin:)!

**Edit**: Lo and behold, [Firefox already has support for HTTP/2][4]! This is the
kind of stuff I want to do!

[^2]: Didn't really have much of a choice, actually.
[1]: http://http2.github.io/faq/
[2]: https://www.gandi.net/ssl/standard#single
[3]: http://git.jacky.wtf/
[4]: http://bitsup.blogspot.com/2015/02/http2-is-live-in-firefox.html
