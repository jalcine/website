---
layout: post
title: "(Re)Introducing Wintermute"
date: 2014-10-02 22:27:02 EDT
categories:
  - wintermute
  - development
  - home automation
  - personal
---

Wintermute's quite a personal project. It was deeply inspired from a
collaboration with a friend back in 2011 about making an open source
artificially intelligent system, almost butler-like, for the open source
community. Difficulties arose, however, and the team disbanded. I still kept a
lot of the source code (since I was the lead developer on it at the time) and
to this day, I spend at least thirty minutes working on this project. It's
personally my way of sharpening my sword when it comes to systems programming
and bridging that knowledge to the world of Web development.

# Direction

Today, I've decided to make the bits of Wintermute (its RPC and plugin
loading systems) into a core library dubbed `libwintermutecore`. From here, I'd
bind this library to `node` and `ruby` and continue working on the extensions
from there. Some things like the core interfaces (data, voice, and graphics)
would probably still be done in C++ or C but thanks to the (potentially)
ubiquitous RPC, it'd be available in lower languages as well.
