---
layout: post
title: "Wintermute: Updates For August"
date: 2013-08-19 15:54:39 EDT
comments: true
tags: wintermute updates
categories:
  - "wintermute"
---

Well, it's August (and has been for a while now). [Wintermute](http://wintermute.jalcine.me)
has been chugging along as you can from its [task-board](https://waffle.io/jalcine/wintermute).
I'm at the point that can make or break Wintermute, it's remote procedure calling system. After that, it's off to the races by building out the plug-ins needed for the system and working on language bindings for the core aspect of Wintermute.

## RPC: ZeroMQ
I've decided to use [ZeroMQ](http://zeromq.org) because of its protocol transparency; the ability to send the same data to
both UNIX sockets and over TCP sockets with no looking back is something I'd want Wintermute to
have. And since support for serial sockets is supported, it'd make it even more interesting for
embedded projects. The only reason behind its "success" is its extremely opinionated approach of
implementation. Maybe it's my lack of complete understanding how sockets work, but having to do
something like:

```c
while (1) {
  // Kill the unicorn.
  // Buy a new unicorn.
  // End scope.
}
```

.. just looks stupid to me, but that's C. I'm way too used to event-driven programming paradigms and object
orientated ones and to do this in my C++ code scared me to no end. Since I'm using Qt, I figured
that not only that there was a C++ binding/wrapper for ZeroMQ, there might be a Qt-level one.
There's [two](https://github.com/jonnydee/nzmqt) [different](https://github.com/wttw/zeromqt)
implementations out there that have a bit of activity behind them. The `wttw` version has a bit of a
licensing issue so that would pose a problem for my project, it being under the GPLv2. The
`jonnydee` fork seems to be good, but attempt after attempt to build it locally failed on my local
system. I'm pointing my finger at `qmake`, it being not that reliable of a build tool outside of Qt
Creator and the likes. I might add it to a PPA of mine in the future.

## Plug-ins: `add_library` ALL THE THINGS
One thing that I noticed is vital is **instant updates**. Before I can explain
the importance of this, I'd have to explain how Wintermute would operate on a
machine. At the current build, Wintermute does nothing more besides creating a
new [`ProcessModule`](https://github.com/jalcine/wintermute/commit/91703e4a72ac7639dea290713c9be9b2941d1d92#src/Wintermute/Procedure/process_module.hpp),
send out one [`HeartBeatCall`](https://github.com/jalcine/wintermute/commit/79ac9f7a4d35b3189ab2e2cf31c8dc85572c4b75#src/Wintermute/Procedure/heart_beat_call.hpp)
and then hang. Nothing much. The intended goal is to replace that hang with the
loading of a plug-in. Wintermute, by itself, can *not* and *will* not do
anything. I chose this to remove as much dependencies to the core binary as
possible so that binaries can be reloaded quickly.
