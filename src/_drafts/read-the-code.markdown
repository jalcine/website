---
layout: post
title: "Read the Code"
category: development
tags:
  - thoughts
  - opinions
---

I've been touching quite a few different languages for the last month (C++,
JavaScript, and Ruby) in an attempt to work on a bunch of stuff at once[^1].
One thing I've caught myself doing time and time again is cloning source trees
of code and following function calls and class definitions to their source to
get a better understanding of how things work and how they might change. It's
tedious but it gives one a chance to understand why on Earth (or rather how)
things like [Swig's tag scoping][swig] works or how [libuv manages
cross-platform library loading][^2]

[^1]: **Pro-tip**: Don't. Ever. Do. This.
[swig]: https://paularmstrong.github.io/swig/docs/api/#setTag
[^2]: For <https://github.com/libuv/libuv/blob/v1.x/src/unix/dl.c> and <https://github.com/libuv/libuv/blob/v1.x/src/win/dl.c>.
