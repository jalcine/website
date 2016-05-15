---
layout: post
title: "On SSL Certificate Authorities"
date: 2015-02-25 22:29:54 EST
category: security
tags:
  - thoughts
  - ssl
  - rant
---

**TL;DR**: Fuck [certificate authorities][1], I'll be my own authority.

I'm not rich, despite that whole story about software engineers making shit tons
of dough. So when I had to make up my mind about buying a certificate, the
first thing that stuck out to me was price. Now, mind you, there is _no_ reason
why these certificates should all be different prices in the case of
single-domain SSL certificates from a provider. My thinking is because of the
nature of certificate authorities[^1] was noble as first, having a central
:heavy_exclamation_mark: authority that we trust :heavy_exclamation_mark: to
ensure that the sites and services we interact with are encrypted. Now it's
become a fucking war of money, charging people for generated bits of data that
someone else can generate (thought not the same exact set) but provide
equivalent security. Yes, I said *equivalent security* since the only thing
that's changing would be the source of trust. And I trust myself more than some
unbodied person on the Internet.

This isn't providing a solution for anything to be honest. But I'll have a
follow up post about my personal CA for _my personal_ use. This'll include
email amongst other things. And it's a freaking stop gap solution until our
friends at the [EFF can get our alternative up and running][2]. That and
the [introduction of HTTP/2][3] should lead to more secure implementations of a
system we're beginning to put more and more of our lives into.

If there's one thing taken away from this, it might be an indicator of my
"cheapness". Maybe I am. But I still can't see how all of this money for
certificates isn't being used right. I did say I was naive.

[1]: https://duckduckgo.com/?q=certificate+authority&t=canonical&ia=about
[2]: https://www.eff.org/deeplinks/2014/11/certificate-authority-encrypt-entire-web
[3]: http://http2.github.io/
[^1]: I'll call them a *CA* from here on.
