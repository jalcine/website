---
layout: post
title: "Why no POSIX Signal Handling, Qt?"
date: 2013-05-27T03:29:24-04:00 -0500
comments: false
tags:
  - rants
  - programming
  - logic
  - ideas
  - qt
categories: rants

---

After using [Qt][1] to facilite nearly all of my C++ project needs, one has to
notice why on EARTH doesn't it have any means of handling POSIX signals as easy
as you handle signals with any other `QObject`? If anything, it should be
considered something of equal importance in `QCoreApplication`.

In my own personal venture to fix this, I've begun working on such a little
lightweight library (might just move it into a header, to be honest) on GitHub
called `[QtPosixSignal][2]`. The `[README.md][3]` took me some time to think up but
it contains the implementation and flow I'd like it to have. I'm open to
suggestions on how to go about via [issues][4] to keep the developmental flow of
things open.

**To better signal handling in Qt applications!**

[1]:http://qt-project.org
[2]:http://rack.github.io/
[3]:https://github.com/jalcine/QtPosixSignal/blob/develop/README.md
[4]:https://github.com/jalcine/QtPosixSignal/issues/new
