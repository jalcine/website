---
layout: post
title: "Wintermute 0.0.3; Nothing Much"
date: 2015-03-05 17:34:18 EST
excerpt: |
  Release updates and reflection about Wintermute 0.0.3.
category: wintermute
tags:
  - progress
  - wintermute
  - release
---

I've pushed out [version 0.0.3 of Wintermute][1] recently. It's still some toy
at the moment but it has a packaged configuration system as well as a
libuv-backed event loop and support for ZeroMQ as a quasi-message broker's
coming. What's missing now is the daemon needed to kick off core plugins
like the external relay to outer networks, more tests to cover feature scopes
and another roundabout to see how JNI support would work. Before this even
hits a 0.1.0 release, I'd want to see this ported to at least Android 5 so
that I can start hacking on Android projects whilst messing with Wintermute.
This is a lot of random jazz without context so I'll cover that below.

## Configuration, Event Loops, Oh My!
In a [previous post][2], I've mentioned how I used libuv to build a `EventEmission`
tool, similar to the one in Node so that Wintermute could chain events and
actions together in a relatively transparent fashion. This is vital for handling
socket connections and implementing an asynchronous callback system in C++. :dizzy: or
nah?

Wintermute's also making use of a relatively flexible configuration system that
follows the syntax of JSON but with a few enhancements. Nothing crazy, but it
does make way for other things like changing ports or sockets to be listened on
and allowing user-provided options for a long of the immutable data.

## JNI Support
Dropbox currently uses C++ to handle the core of their product[^1] and me being
ever so interested in C++ figured that keeping Wintermute's internals in C++
was a good choice in terms of speed and targeting strengths of particular
platforms[^2]. In order to get better support for the [Android platform
leveraging JNI][4] and working in favor of the virtual machine made the most sense.
I'm still running through the documentation under Android about it but it looks
a bit hairy, as with all of the tools out here. The goal of this is to have
Wintermute's configuration and RPC support all in one package. Having that be
part of the core Wintermute package gives me a bit of control of what parts of
Wintermute that I know I can use and maybe if ever off grid with a bit of space
can use the phone as a stand-alone instance. Who knows :confused: [^3]?

## Testing Stuff
Testing's important if you care about keeping track of progress and preventing
old issues from coming back up. This is something I didn't tie into Wintermute
when I started it out back in 2012. I did manual tests that require debugging
statements, constant rebuilds and manual driving of code. Bad way to go about
things. I've added quite a few unit tests for Wintermute to cover how each
class should operate but I'm debating adding more feature-level tests using
something like [cppspec][][^4]. On that note, `CxxTest` is bulky and adds
another development build time dependency for Wintermute, hence my want to move
all of the testing to use [greatest][]. Research, research.

Testing's good, y'all; it keeps them thinking caps of yours sharp.

[cppspec]: https://github.com/tpuronen/cppspec
[greatest]: https://github.com/silentbicycle/greatest
[1]: https://github.com/jalcine/wintermute/releases/tag/v0.0.3
[2]: <{{ site.url}}{% post_url 2015-02-05-using-libuv-for-event-emission %}>
[3]: http://www.oleb.net/blog/2014/05/how-dropbox-uses-cplusplus-cross-platform-development/
[4]: https://developer.android.com/training/articles/perf-jni.html
[^1]: [It's a cross-platform implementation, bat-shit cool.][3]
[^2]: Realistically, this is my laptop, a Nexus 5 and a Raspberry Pi B+.
[^3]: I do, this is a goal since a lot of commute is underground nowadays.
[^4]: That project hasn't been updated in quite some time, so I'd walk
