---
layout:  post
title: "Remote Procedure Calling"
date: 2014-02-09 22:58:00 EST
categories: development
---

Working on [Wintermute][] has me doing quite the bit of research. That's
always welcome since I don't do as often as I should. The current bit is on a
resourceful yet flexible means of [remote prodecure calling][] or RPC, for
short. Now, the reason why Wintermute would need something like this is mainly
due to its nature. I want Wintermute to be able to not only run in multiple
threads (as most modern applications should do), but also in separate
dedicated processes. They wouldn't also be running on this local machine but
also hopefully on remote machines and mobile devices as well. Remember the
idea behind this project to begin with?

[wintermute]: http://wintermute.jalcine.me
[remote_prodecure_calling]: http://en.wikipedia.org/wiki/Remote_procedure_call
