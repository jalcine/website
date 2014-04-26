---
layout: post
title: "The Idea Behind Wintermute"
date: 2014-03-30 11:57:58 EDT
excerpt: "The process to the ideas and thoughts that wrought Wintermute."
categories:
  - wintermute
  - thoughts
---

[Wintermute][]'s a [software project][sp] that I've been working on for since July
27, 2011. Well, that's when the first commit was made, so to say. A few friends
and I drafted the ideas and visions we had for the project. We saw it being a
basis of personal assistants, teachers, and guides for the world. Overly
ambitious, but hey, the best of plans are. However, over time, we shared a 
level of discomfort about our capabilities, levels of progress and the 
actuality of us reaching our goal (in our lifetimes). We wanted to build 
awesome software and we couldn't.

Around mid-2012; I decided to pick up the code and try it again. Over the last
few years, I've spent more time attempting to understand what was it that I
personally wanted from Wintermute. Its capabilities, future functions and even
its interface took a lot of deliberation, Q & A, observation and tons of trial
and error. To this day, I get closer to just `rm -rv` in the source code
directory and starting from scratch. It's hectic but the idea of what
Wintermute should be gets sharper each time a file's rewritten from
scratch.

# What *Should* Wintermute Be?

It's probably the hardest question to answer. But to sum it up in a word, it
should be **awesome**. Seriously, Wintermute is one of those projects that I'd
want to last quite some time, looking at the Vim text editor and Linux as two
role models. The function is mainly to serve as a bridge between devices, to
provide the device's capabilities to the other devices within its own
environment and use its devices to expand its knowledge about what it knows
about said environment. From there, its primary function should be that of a
servitude position. In less jargon, it should be the **technological equivalent
of a butler**.

# A Story In Use

It's easy to build something when you have an idea of how and why you'd use
it. I've decided to write something like a user story of a few hours to a day
of using Wintermute. They range from time periods like in the [morning][wsm],
passive use like while you're [eating][wse] or [exercising][wsx] and heavy
active use like while you're [shopping][wso] or [reading][wsr]. Of course,
they might be a bit over the top in their ambitions, but if you know me, I
tend to aim for the stratosphere.

# The Architecture

Every good application has an architectural diagram of sorts, no? For
Wintermute, the current target for the RPC system to be very pub-sub
orientated. The underlying mission is to have as independent as possible
modules, or representations of function in Wintermute, while still encouraging
the sharing of data whenever necessary. For example, each process would have
the `Heartbeat::PulseModule` loaded so that they can report their existence to
`Heartbeat::MonitorModule` modules on the network. As expected, the
`MonitorModule` is restricted to be the only one monitor per machine. This can
be used then to query for the last known existence of other processes with
specific modules within them.

## Current RPC Implementation Strategy

Right now, I'm targeting the 0.1.0 release of Wintermute to have its internal
RPC system down-packed. It'd ship with the `heartbeat`, `daemon`, `dbus` and
`zeromq` although I might drop the `dbus` plug-in once I can get ZeroMQ and Qt
playing a lot better together. From there, I'd mainly unit-test the hell about
the application and work on making the core binary as light and lean as
possible. 

At the moment, only `Call` objects can be sent and received over RPC. I'm
looking to have `Signal` objects sent over so that modules could react to
signals invoked from another module. Something like this I can see using for
data mining and voice recognition tools. The thing about `Call` objects that I
liked the most is that they're defined in JSON, making it possible for any
language or device that can use JSON, like an Android application, a Web page
or an Arduino device can work with this. It could be even cached onto a NFC
tag; the possibilities are as endless as the flexibility of the platform.

## Mobile? Android First (Ubuntu Touch Maybe)

I'm a big Android user and I'm definitely aiming to have a means of
interactivity with Wintermute on my mobile devices. Leveraging the amount of
data that a mobile device can provide about its owner (it's a **lot more than
necessary**) could not only further enrich Wintermute's databases but push its
ability to provide a new interface on a device that tends to be close to me. A
friend of mine, [rrix][]

[wintermute]: http://wintermute.jalcine.me
[sp]: https://github.com/wintermuteapp/wintermute
[wsm]: http://wintermute.jalcine.me/stories/morning
[wse]: http://wintermute.jalcine.me/stories/eating
[wsx]: http://wintermute.jalcine.me/stories/exercising
[wso]: http://wintermute.jalcine.me/stories/shopping
[wsr]: http://wintermute.jalcine.me/stories/reading
[rrix]: http://rix.si/
