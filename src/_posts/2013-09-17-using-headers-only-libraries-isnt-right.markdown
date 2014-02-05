---
layout: post
title: "Using Headers-Only Libraries Isn't Right"
date: 2013-09-17 07:17:42 EDT
category: ideas
---

In my time doing C++ development, I've noticed this trend of having
"headers-only" libraries. It looks like an easy way to just drop in a bunch of
functionality to an application without having to worry about library files
and dependencies. If you're a Ruby developer, it's a bit similar to using
Bundler to install your gemset to a path other than the one used globally,
i.e: `bundle install --path=vendor/cache`.

## Packing on Dependencies

When it comes to native libraries, I can't see how this would be a useful
advantage. The greatest opporunity cost here would be a sense of portability,
but that's only because now the dependencies of said library becomes *direct
dependencies* for your application now. Who wants that? This also defeats the
power of dynamically linked binaries on most systems. One could go as far as
to say that without a dynamically linked binary, your application becomes
"fixed in time" when it comes to included binaries; stripping it of the power
of potential speed boosts, security fixes and overall performance jumps
because you wanted to stick to a specific version.

Of course, this can be excused for some kind of mission-critical software and
parts of academica, but it's just plainly absurd.

## Size

One definite value-add from using separated library binaries is the **size of
your own application**. It wouldn't be half a gigabyte, packed with all of the
symbols under the sun. The resolving time would be slow just because of
duplicity. Debugging would be a pain as well since travelling through that
stack trace may not be O(1)[^1].

**Just don't do it, write a proper library**.

[^1]: I'm not sure about this.
