---
layout: post
title: "Adding Custom Pages Via Markdown to Doxygen"
category: development
tags:
  - doxygen
  - documentation
  - how-to
---

One thing I need for [Wintermute][] is the ability to add extra pages of
documentation that of which could be plain Markdown files. Just adding a list
of Markdown documents, however, to the `INPUT` configuration option didn't do
the trick. A quick search on DuckDuckGo led me to [an entry][] on how it works
but it's a little confusing how it seems to explain things. The following check
list should help:

* Ensure that it's in your `INPUT` list.
