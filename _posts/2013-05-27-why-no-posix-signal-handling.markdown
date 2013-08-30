---
layout: post
title: "Why no POSIX Signal Handling, Qt?"
date: 2013-05-27T03:29:24-04:00
comments: false
tags: rants programming logic ideas qt

---

After using [Qt](http://qt-project.org) to faciliate nearly all of my C++
project needs, one has to notice why on EARTH doesn't it have any means of
handling POSIX signals as easy as you handle signals with any other `QObject`?<!-- more -->
If anything, it should be considered something of equal importance in
`QCoreApplication`.

In my own personal venture to fix this, I've begun working on such a little
light-weight library (might just move it into a header, to be honest) on
GitHub called [QtPosixSignal](https://github.com/jalcine/QtPosixSignal). The
[README.md](https://github.com/jalcine/QtPosixSignal/blob/develop/README.md)
took me some time to think up but it contains the implementation and flow I'd
like it to have. I'm open to suggestions on how to go about via
[issues](https://github.com/jalcine/QtPosixSignal/issues/new) to keep the
developmental flow of things open.

**To better signal handling in Qt apps!**
