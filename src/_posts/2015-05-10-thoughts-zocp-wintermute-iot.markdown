---
layout: post
title: "Thoughts about ZOCP, Wintermute, and the IOT"
date: 2015-08-30 05:46:34 -0400
category: wintermute
tags:
  - zeromq
  - iot
  - wintermute
excerpt:
  ZeroMQ and IoT? I think <strong>yes</strong>.

---

I'm halfway through [a video about ZOCP][1], a nifty protocol layer that allows
networked distributed programming to just _work_ from [FOSDEM this year][2]
presented by Arnuad Loonstra. I noticed it from the [ZeroMQ development
mailing list][3] a few weeks ago and I had it queued to watch. I'm actually
really blown away at how easily this stuff seems to work. There's a scene
about 3 minutes in where the presenter shows how literally from the terminal,
in less than 10 lines of code, a new 'node' appears to the ZOCP network.
Can you say *bananas*? Something like this is super interesting largely
because from the outside, the [IoT][] is a hot mess. That's putting it
lightly. Portability is a pain if you don't abstract critical aspects
of the actual "chatter" of your system away from the underlying "work"[^1].
That can get harder to do depending on what's communicating with that
(Arduino to laptop, Raspberry Pi to Spark, etc). Going back to the
talk, the structure of ZOCP looks a bit like this:

{% img "zocp-plumbing.png" alt:"Plumbing of ZOCP." class:"present" %}

I have to admit, looking at this got me a bit confused. Sure, I understood the
_capability_ exchange aspect of things (hey buddy, I can do "X", "Y" and "Z"!) but
the _signals_ and _streams_ layers went over my head. Following through with the
video, signals were explained as "IDs with [associated] data". That clicked when
I remember how the counter's toggle was enabled and disabled, other subscribers
were able to update their values. Cool. _Streams_ were literally a wrapper on
top of conventional (hah) streams served via TCP. The presenter goes on to
explain how streams worked in ZOCP and the likes.

Arnuad's very direct and blunt on the capabilities of ZOCP. It's meant really to
just make the data that's available from one particular application available to
another. There was a mention of multicast support which allowed for
communicating over multiple networks (cloud-systems anyone?) but for a home
network, this is dope. This revealed a bigger problem with the Internet of
Things, though. As far as I know (or that's publicly available), we haven't
solidified a specification on how entities should be represented over a network
let alone to a machine. Everyone's (I'm GLARING at you, Belkin)[^2] working on their
own proprietary "plug-n-play" solutions for things, but that makes it hard for
not only adoption, but interoperability with other devices. This is what I'm
aiming to achieve with Wintermute, to be honest, as a side goal; allowing
entities to build formalized representations of themselves and have people work
on them. You'd think that it'd be as simple as plugging in your devices, firing
up your primary "authoritative" machines and then being able to watch a map of
the activity of your devices. Think [Grafana][] meets [Segment.io][]'s funnel of
services.

Until a more "formal" setup of having interconnected devices can be come to be,
we're going to have some time to get before the IoT becomes real. What I had in
mind, though a bit expensive in implementation, was having something similar to
how the Chromecast setup works but not quite. Something like [WiFi Direct][4][^3]
could work for the setup process, provided handshaking and the likes can go
through.

[1]: http://mirror.as35701.net/video.fosdem.org//2015/devroom-internet_of_things/deviot02.mp4
[2]: https://fosdem.org/2015/schedule/event/deviot02/
[3]: http://lists.zeromq.org/mailman/listinfo/zeromq-dev
[4]: http://www.wi-fi.org/discover-and-learn/wi-fi-direct
[iot]: https://duckduckgo.com/?q=internet+of+things&ia=about
[grafana]: https://grafana.org
[segment.io]: https://segment.io
[^1]: That's fair to say of legacy Web applications or frameworks that dive deep into your business logic.
[^2]: Eh, this is loaded. I only know of Belkin, Sonos, Western Digital and Panasonic doing this.
[^3]: This looks limited to specific kinds of hardware, YAY FOR VENDOR LOCK-IN :angry:!
