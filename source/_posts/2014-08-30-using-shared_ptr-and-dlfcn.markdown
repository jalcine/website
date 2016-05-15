---
layout: post
title: "Using `shared_ptr` to manage `dlfcn.h`"
date: 2014-08-30 23:20:15 EDT
categories:
  - development
  - c++
  - libraries
---

In lieu of [getting Wintermute's library-esque approach working][1], I've been
hammering the `<tr1/memory>` and `<dlfcn.h>` headers for about a week or so. It
might be more, but in time I've spent in front of the terminal reading or just
in the browser [reading documentation][2] and [source code][3]. The idea of
`std::shared_ptr` is so freaking awesome, I used it a lot within Qt with
[`QSharedPointer`][4] and the meta-object hierarchy it employs. But now,
without that beautiful harness in an attempt to build something that'd be not
only fast but easier to incorporate in other projects, the prerequisite
learning curve just hit the sky.

The pain point I have currently with my code is here:

{% gist jalcine/93bc496a6a0ac14bec18 pain_point.cpp %}

Focusing on line 11 of that snippet, it seems like setting `nullptr` to
`handlePtr`. According to the [documentation for `std::shared_ptr::operator =()`][5],
the normal behavior seems to be destroying the original value and then setting
the internal data's reference to the new value. Which is okay. And I can live
with that.

But here's something fun. The class that's used by `std::shared_ptr` here is a
[undefined `struct`][6]; it's the suggestion I got when asking in IRC in
`##c++`. If you have a better idea, it'd be lovely but for now; I managed to
load the plugin and resolve functions from it. The only pain point right now
(which kind of makes sense) is that it's not able to delete the memory held by
the `shared_ptr`. Good chance I'd update this post with my solution, but for
now, I'm quite stumped. My progress is going to be marked on [a pull
request][7] so feel free to comment there on suggestions. Cheers!

[1]: https://github.com/jalcine/libwintermutecore/issues/7
[2]: http://en.cppreference.com/w/cpp/memory/shared_ptr
[3]: http://www.scs.stanford.edu/histar/src/pkg/uclibc/include/dlfcn.h
[4]: http://qt-project.org/doc/qt-4.8/qsharedpointer.html
[5]: http://en.cppreference.com/w/cpp/memory/shared_ptr/operator%3D
[6]: https://github.com/jalcine/libwintermutecore/blob/56505e0b8c4f83ecc8da167586898a0dc07bebcc/src/libwintermutecore/plugin/library_handle.hh#L25
[7]: https://github.com/jalcine/libwintermutecore/pull/25
