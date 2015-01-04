---
layout: post
title: "Using libuv for Event Subscription & Invoking in Wintermute"
category: development
tags:
  - libuv
  - thoughts
---

I've been looking very eagerly at [libuv][] as a basis for cross-platform
asynchronous work handling. It provides logic to work with networks, files and
even libraries. So I figured that something like this would be dope for
[Wintermute][][^1]. I read the contents of the [libuv book][] and felt that I
still didn't know enough to get what I had in mind into code. So I decided to
hammer out some code into [a repository for experimentation][]; makes it easier
to share progress and get some common ideas out of the way.

What I wanted from libuv, or rather what I wanted to build _using_ libuv was
something that allowed me to send out an event request for a named action and
have something that listened for said requests and handled that work. It was
very similar to how Qt handled events but after a bit of digging, I figured
that something like [`EventEmitter` for node][nev]. Fortunately, I stumbled upon
a [repository  that attempts this in C][uv-emitter]. Only a few qualms about
this is that it's all in C so dropping that straight into a C++ (let alone a
C++11 project) wasn't going to be that easy. AND it's one of the header-only
libraries *shudders*. [Using the `uv-emitter`][emitteruse] looks amazingly
straightforward, but I wasn't sure how this would work in Wintermute now.

---

A few cups of tea and a comic book later, I came up with the following on how
the event loops in Wintermute would look:

{% highlight text %}
* Call Wintermute::Tunnel::sendMessage().
  * Build a Wintermute::Message::Event object with the provided message.
  * Set the event to be Message::Event::DirectionOutgoing.
  * Emit the event by calling raise() on the event object.

... Event loop ticks on ...

* Catch the event defined by `Message::Event`.
  * Find & invoke the handler for this kind of event.
    At this point, the handler would be methods that hook to a specific
    Wintermute::Dispatcher instance.
{% endhighlight %}

I noticed that _sending_ messages was ample times more easier than actually
_receiving_ them. What kept tripping me up was how would the system know _when_
to fetch messages from receivers. What I had to accept as given things was that
the event loop would be always running in anticipation of a read request from
the socket.

At this point, I realized that Wintermute **sorely** needed a event loop. I
had to rethink a few things, specifically how the public facing part of
Wintermute would interact with the rest of the system. Also, I had to
realize that there's a good chance that I would be implementing an
accompanying binary for Wintermute to allow for quick introspection into the
system. Looks like Wintermute's going to have a fat singleton like the good ol'
days.

## Building the Event Loop

All of the logic for Wintermute's event loop is stashed under the
`Wintermute::Events` namespace. A few classes are stored under the namespace,
those being `Event`, `Emitter`, and `Loop`. These classes are meant to wrap the
logic used by `uv-emitter` and `libuv` so that it's C++(11) friendly and
extensible for other tools to use.

The `Event` class is meant to serve as a raw data structure to hold arbitrary
data (as defined by its subclasses) for the purpose of carrying out an event.
Things like the name of a plugin that was recently loaded or a new message
that's ready to be sent can be stashed into a subclass of a `Event`.
**Polymorphisms FTW :raised_hands:**!

The `Emitter` class is meant to be sub-classed by classes interested in
capturing or listening to a specific event in the current event loop.

[libuv]: https://github.com/libuv/libuv
[wintermute]: https://github.com/jalcine/wintermute
[libuv book]: https://nikhilm.github.io/uvbook/
[nev]: https://nodejs.org/api/events.html
[uv-emitter]: https://github.com/jwerle/uv-emitter
[emitteruse]: https://github.com/jwerle/uv-emitter#usage
[a repository for experimentation]: https://github.com/jalcine/uv-experiments
[^1]: Almost everything is going to deal with Wintermute! :smile:
