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
libraries :scream:. [Using the `uv-emitter`][emitteruse] looks amazingly
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

Cracking some knuckles and running my hand through my hair, I began to write
out the C++11-ish version of `uvemitter` into Wintermute. The issue with
`uv-emitter` that I had is constant breaking of Wintermute's linting and how
it wasn't designed to be C++ friendly. That seemed unfortunate but I've taken
it as a chance to get deeper into `libuv`.

The [`Wintermute::Events`][eventshpp] namespace serves as the basis for all
event-related logic in Wintermute. A snippet of it without comments is
provided below:

{% highlight cpp %}
#include <wintermutecore/globals.hpp>
#include <functional>

using std::string;
using std::function;

namespace Wintermute
{
  namespace Event
  {
    class LoopPrivate;
    class EventPrivate;
    class EmitterPrivate;

    class Loop
    {
      public:
        explicit Loop();
        virtual ~Loop();
        int run();
        int runOnce();
        static Loop::Ptr defaultLoop();
    };

    class Event
    {
      public:
        typedef function<void (const Event::Ptr&)> CallbackFunction;
        explicit Event(const string& name);
        virtual ~Event();
        string name() const;
    };

    class Emitter
    {
      public:
        explicit Emitter(Loop::Ptr loop = Loop::defaultLoop());
        virtual ~Emitter();
        void emit(const Event::Ptr& event) const;
        void on(const string& eventName, Event::CallbackFunction& cbFunc);
        void off(const string& eventName);
        void flush();
        Loop::Ptr loop() const;
    };
  }
}
{% endhighlight %}

With the above, it was easy to do the following:

{% highlight cpp %}
namespace Wintermute::Events = we;

class CookieEvent : public we::Event {
  public:
    CookieEvent() : we::Event("cookie") {};
};

we::Emitter::Ptr emitter;
emitter.once("cookie", [](const we::Event& event) {
  std::cout << "I got a cookie!" << endl;
  });
emitter.emit(make_shared<CookieEvent>());
Loop::defaultLoop()->run();
{% endhighlight %}

Of which, would do the following expectedly:

{% highlight bash %}
$ build/test_loop
I got a cookie!
[test_loop exited with code 0]
{% endhighlight %}

This is all fine and dandy for sending messages in Wintermute, since we can
just do the following now (using Wintermute-style code):

{% highlight cpp %}
MessageEvent::Ptr msgEvent = make_shared<MessageEvent>(message);
msgEvent->direction = MessageEvent::DirectionOutgoing;
emitter->emit(msgEvent);
{% endhighlight %}

But this brought me back to my original problem; not being able to listen and
wait for messages from receivers. It hit me over (yet another) cup of tea:
receiving messages would be similar to reading a infinite stream. For now, I
figure that using a polling system would work best; having it query each
receiver in a separate thread every 10 seconds for a new mes

[libuv]: https://github.com/libuv/libuv
[wintermute]: https://github.com/jalcine/wintermute
[libuv book]: https://nikhilm.github.io/uvbook/
[nev]: https://nodejs.org/api/events.html
[uv-emitter]: https://github.com/jwerle/uv-emitter
[emitteruse]: https://github.com/jwerle/uv-emitter#usage
[a repository for experimentation]: https://github.com/jalcine/uv-experiments
[eventshpp]: https://github.com/jalcine/wintermute/blob/feature/event-loop/src/wintermutecore/event.hpp
[^1]: Almost everything is going to deal with Wintermute! :smile:
[^2]: Once I get to the 0.1.0 release of Wintermute, I'll work on decoupling it from Wintermute.
