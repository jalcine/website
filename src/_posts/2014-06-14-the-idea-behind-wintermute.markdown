---
layout: post
date: 2014-06-14 22:14:51 EDT
title: "The Idea Behind Wintermute"
excerpt: |
  Giving some hindsight as to why I built Wintermute.
category: wintermute
tags:
  - wintermute
  - thoughts
---

**WINTERMUTE** is the software project that propelled my
knowledge of simpler programming paradigms like inheritance, polymorphisms
and the likes over the last few years. I've taken the liberty of at times,
blowing away the entire commit history just to start anew. Wintermute
had a proper and here, I plan to expand on that.

Wintermute, when described to someone outside of the grinding gears of the tech
multiverse, is an ambition to implement a computer network and interface
similar to that of Iron Man's **J.A.R.V.I.S**. The
omnipresence, vast amount of semantic knowledge it holds and its ability to
use both of those to provide context-relevant, if not crucial, information
about the current scenario is the core essence of what's to be captured by the
Wintermute project.

## Knowing Itself

Wintermute requires a means of walking over seemingly massive sets of data
in mere moments. We already do this with current Web applications but how
massive _is Wintermute's massive_? Realistically, I can't put it in a
proportion for the purpose of having a working analogy but I'm going to
go with the hunch that it's extremely _massive_. What I can say is that
the kind of data Wintermute would probably get on a bad day would be
similar to a few engineers at Facebook running a service that'd check
the number of times a person used a word of numerical significance in
their account's entire existence and that of their friends. A lexical-
and graph-based search!

The kind of information that Wintermute would hopefully collect wouldn't be
saved in a classical relational database. Instead, each event and moment would
be saved into a **ontological database**. Such a database would preserve context
on each _row_ or event and allow Wintermute to act in the scope of that event.

## Communicating with Itself

As most networked applications are, Wintermute wouldn't be just one instance of
itself running on Joe Schmoe's MacBook. What's envisioned is that some
sub-instances of Wintermute would run on a DIY kind of supercomputer, like the
Parallela suite for USD$100. This could handle the work of the heavy
number-crunching, the discovery and cataloging of new data and reindexing of
the old. A robust, tried & true [socket communication library][zeromq] would be
more than needed for such a job.

Serializing messages into a format that we can quickly dispatch between
processes has been more or less solved by using partial selections of
representational data. Additionally, to do a cheap form of data integrity
checking, including a checksum with each message allows for one to then
challenge the actual integrity of provided data.

A formalization of what processes, or rather modules, are available on a
machine wouldn't be necessary for the sake of remote execution but they would
be necessary for discovery and maintenance of a suite of processes in order to
ensure that each running processes has what they need to operate. These modules
could have exposed methods that a remote process could then invoke and await a
reply, if said remote method _has_ a return value.

With parallel processes, message serialization and remote procedure invocation,
Wintermute can run across a vast amount of machines and provide the power it
needs when it needs to!

# Building Wintermute

The technical logic behind Wintermute is a bit weird. Initially, I tried
working on the project as coming from a core executable meant to run on
dedicated machines and build platform-dependent executables that then fed to
the core executable to handle 'raw Wintermute-esque' work. This made less and
less sense to me so I decided to wipe the slate clean and try a different
approach.

## The Library and the Driver

The initial version of Wintermute isn't going to be an executable. Instead,
it'll be a library that handles things that Wintermute plans to abstract away.
These would include plugin loading, remote procedure loading, process
identification on the procedure pool and a bit more. As usually with most of my
C++ projects, I'll be using Qt for this, but it'll be Qt4 for now until I can
wrestle using Qt5 properly with CMake. This also means I'll be focusing on
making [CMake support for Vim][cmake.vim] even better. It'll be fun!

[wntr]: http://wintermute.jalcine.me
[sp]: https://github.com/jalcine/wintermute
[zeromq]: http://zeromq.org
[cmake.vim]: https://jalcine.github.io/cmake.vim
