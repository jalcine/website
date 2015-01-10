---
layout: post
title: "Ambitions for Wintermute"
date: 2015-01-10 04:36:20 EST
category: wintermute
tags:
  - long-reads
  - development
  - affirmation
---

> From [naming](/weblog/wintermutes-the-name/) to
> [thinking](/weblog/the-idea-behind-wintermute/),
> [Wintermute][] is a fickle project. One so complex, I legitimately forgot my
> objective whilst working on it. This entry is going to serve as a means of me
> keeping track of the end goal. If there's one thing that happens with
> passion projects, it's definitely the overwhelming amount of emotion one can
> throw into it.

# What's Wintermute [Going to be] Capable Of? {#synopsis}

Wintermute is an attempt to build a "universal" communication platform for
existing and future bits of software I find and plan to build. The idea is
that if it can communicate over a network or between processes on a local
machine; Wintermute can use it and make it work in its favor, whatever it may
be. The [core library][wintermute] is meant to be the foundation that hides a
_lot_ of the platform-dependent nuts and bolts and make things work like
remote procedure calling, extension support & discovery and whatever that
should be handled by the core instance of Wintermute.

From there, we only can go up in terms of extensibility. The idea is to have
plugins, who **consume data** collected by Wintermute or **add to** the pool
of data that Wintermute has. It's very binary because things tend to be a _lot
simpler_ for computers that way. It, in my opinion, will reduce complexity
when it comes to working with more lower level pieces of hardware like the
[Spark][sparkio] line of tools or the [Raspberry Pi][rpi]. You know, for that
home automation and wearables tech stuff everyone's raving about.

![Spin, my Pi, spin.](/images/rpi-rotate.gif){:style="margin: 1rem auto"}

There's a few things I want Wintermute to do. Having it written out makes it
more of a declarative thing and gives me a bit of direction as to what
Wintermute _should_ be capable of doing. Mind you, I'm open to
[suggestions](#comments) for the list, just be willing to provide a solution
for execution or implementation.

  * **Rudimentary natural language processing** -- Mixing together things like
  [Stanford's CoreNLP][corenlp], [PocketSphinx][cmusphinx] and
  [MaryTTS][marytts] would allow for a round house solution for having
  a human-like interactive system. A [NLUI][], if you will.
  :smirk:

  * **Telephony abstraction** -- This is a bit of a pipe dream because it's
  still so freaking hard to do as far as I know. A really dope goal would be
  to successfully get a GSM/CDMA compatible device and have the audio
  input/output be relayed over a network. The latency will be insane and
  probably shatter the whole efficiency of immediate voice communications but
  I'd be damned if I couldn't natively make a call and send SMS from my
  laptop. It'd also help with automatically screening calls depending on my
  current activity (if Wintermute's aware of it).
  ![Home automation](/images/im3-rdj-robe.gif){:style="width:40rem; margin: 1rem auto; display: flex"}
  Things like sending calls to voice mail with a small prompt if I'm exercising
  or sending a text message to people whilst I'm in transit and informing them
  of when would be a good time to call back (or have them leave a message
  and have Wintermute play it back when I'm over ground).

  * **News aggregator and condenser** -- I've always hated unsolicited long
  reads. I shouldn't be forced to shove down more than 250 words unless I've
  specifically asked to. My goal here is to have Wintermute read out bylines
  of articles and potentially explain how they've changed over a period of
  time. If needed, Wintermute can then to continue to provide relevant
  information on said story. Again, an ambitious goal and largely depends on
  decent categorization of information from journalists and their platforms of
  publishing.

  * **Home automation, mointoring and assistance** -- Because it's the new hot
  thang on the block (for the last five years or so, as far as I know). I've
  always wanted[^3] a means of viewing the status of everything at home
  without really having to go _to_ it. Granted, I live in an apartment, but
  being able to check on the temperature of different rooms or controlling
  speakers and television sets is really cool of a prospect. Also, this can go
  outside of the home; who knows? :sparkles:
  ![Home automation](/images/lame-home-automation.gif){:style="width:40rem; margin: 1.5rem auto; display: flex"}

  * **On-the-fly speech recognition enhancement** -- One thing that's always
  going to be tricky about speech recognition is the _recognition_ part. I can
  live with the speech part (for now), but speech recognition is something I
  can actively work on improving. I'm not 100% sure if this will actually
  improve the recognition rate[^4] but I know that it'll make the matching of
  phrases and words more accurate for my particular voice. Heck, if more
  people use it, we can upload our (selected) audio recording up to a popular
  corpus like [Voxforge][] and help improve speech recognition for everyone!
  More :beers: all around!

  * **Multimedia management (TV, music, books)** -- Now this is where it gets
  a bit interesting. I tend to use a lot of streaming services for my music
  and video needs, specifically [Spotify][] and [Netflix][] for "premium"
  content and [YouTube][] and [Vimeo][] for everything else. In addition to
  the software they provide, I use other applications to handle podcasting,
  video blogs, etc. The ideal setup would be for Wintermute to take advantage
  of a myriad of tools like [DLNA software][], [AirPlay][] and others to make
  the act of playing a local collection of music and videos a lot simpler
  to do with compatible devices as well as allowing other devices to 'hone in'
  on what's going on.
  ![FTW](/images/rdj-deal-with-it.gif){:style="width:40rem; margin: 1rem auto; display: flex"}
  Being able to say "Put on the show I was watching last
  night" and being presented (or prompted) with a list of what I did watch
  (be it on YouTube, Netflix or from my purchased collection) is when I
  think I'd be comfortable with things :laughing: :relieved:. It'd be also
  cool to have plug-n-play support for anyone to walk into a room, see what's
  playing and control said content (with some form of ACL, of course).

  * **Logistics reporting (packages, device whereabouts)** -- This is a very
  finicky and potentially dangerous part to Wintermute (if nothing else seemed
  that dangerous). Providing every device that _can be mobile_ with a way to
  report back to Wintermute its current whereabouts can make for a lot of
  useful things. Things like [Tasker][] become verbally possible without having
  to use it. Being able to tell Wintermute that whenever my laptop and my
  Bluetooth headset aren't paired for more than ten minutes to lock my
  laptop's screen would be way cool. This can even go as far as to handle
  assets like packages and potentially things like objects with [Tile][]
  beacons on them.

  * **Knowledge discovery, enhancement and development** -- This won't be easy
  at all. This is the focus of companies like [Wolfram Alpha][] and [Google][]
  so to duplicate effort would be wasteful. A very good chance that we'll
  leverage their work as well pull in public-domain reference material from
  projects like [Protege][owl] for sourcing a lot of our [ontologies][].
  ![Does an Internet](/images/brb-downloading-the-internet.gif){:style="width:30rem; margin: 1rem auto; display: flex"}
  However, the point of this is to allow Wintermute to make other parts of
  itself more useful. For example, if Wintermute's aware of coverage
  information for my cellular device and knows my destination, it could inform
  me before hand about the lack of reception in the area. It could also do the
  same when I'm headed out to eat; inform me about spots in the area that are
  similar to ones I've visited to before. The clique collection of information
  from packages, flights and typical transit routes could be added into the
  fold, but that's definitely something for later down the route.

![Does an Internet](/images/rdj-im3-haul-suit.gif){:style="width:80%; margin: 1rem auto; display: flex"}

All in all, I want something similar to, if not exactly like, [Jarvis][]. It's
overly ambitious and on that reason alone is why I'm eager to continue
hammering at this project. If anything, I've learned time and time about
continuous deployment, having a strong test suite, a maintainable repository
and the benefits of composition and abstractions in software _just_ from this
project[^1]. And this is just the crux of it.

# What's The Approach? {#approach}

When I first started hammering out the code base for Wintermute, I used a shit
ton of tools to make it quick 'n' dirty. [Qt][], [Boost][], [CMake][] and a lot of
battle-tested libraries to just get my ideas into code quickly. As time went
on, I noticed that I couldn't just have it running only on my laptop. I'd want
to have certain instances of Wintermute running on an in-house box, some
boxes that are permanently connected and others running on my phone and other
bits of embedded hardware. I took some time to re-think the approach and
decided on tearing down all that I had to rewrite Wintermute as a shared
library.

From there, I also decided to reduce the number of dependencies that
Wintermute had. I dropped the Qt library in favor of using the standard
C++ library. This gave me a chance to revisit some of the more disguised
concepts in C++ like handling event loops, or fiddling with dynamic library
loading. What I realized is that I would have to handle a lot of cross
platform issues when building out Wintermute for other devices[^2]. At first,
I thought this to be a super big and annoying challenge, but I think that
this'll allow me to have focused builds of Wintermute and iterate accordingly
for each platform. It's not like I'm rebuilding streams in C++, though.

# So, What's the Library Doing? {#library}

The core library of Wintermute, `libwintermute` is meant to provide the
following:

  * **cross-platform local/remote procedure calling**: The biggest challenge
  I think that I might run into when porting to new platforms would be getting
  Wintermute to send information from one remote machine to another. Discovering
  hosts to communicate with can be tricky since (from a security standpoint)
  people can potentially spoof instances of Wintermute, query for [PII][]
  and fuck things up. Having a known central "hub" of sorts is desirable
  but falls back to that idea of a central point of failure. It's a problem
  I'll have to revisit time and time again.

  * **extensibility support**: Wintermute's core library handles the work of
  managing plugins for specific instances so that one can work knowing that a
  particular bit of functionality is available on demand. However, using
  plugins directly probably wouldn't be the appropriate way of handling
  things. Modules are Wintermute's way of collecting functionality into a
  simpler object-orientated(ish) way. This also needs a bit of work since
  module discovery can be iffy as well.

  * **event management**: The one thing that made Wintermute so easy to build
  in Qt was its in-built event loop. Now, I'm using [libuv][] to handle (for
  now) the delegation of "events". This required me to build something similar
  to [EventEmitter][] for C++. There's one for [C][uvemitter], but I prefer
  something that takes up more of the C++ paradigms.

![Does an Internet](/images/im1-jericho.gif){:style="width:80%; margin: 0rem auto; display: flex"}
With the preceding, (hopefully) any application can then utilize
Wintermute's base functionality and build a tool that'd feed back to
the connection system of Wintermute. At least, that's the plan. Right now,
I'm juggling between the set up of [ZeroMQ][] for Wintermute and crafting
an abstracted (enough) event loop system for Wintermute which right now
is heavily influenced by `libuv`. I try to work as transparently as possible
(you'll even catch me force pushing, a lot).

[wintermute]: https://github.com/jalcine/wintermute
[akonadi]: http://kde.org
[pocketsphinx]: http://sourceforge.net
[mitie]: https://github.com/mit-nlp/MITIE
[scnlp]: http://nlp.stanford.edu/software/index.shtml
[pii]: http://www.wikiwand.com/en/Personally_identifiable_information
[libuv]: https://github.com/libuv/libuv
[EventEmitter]: http://nodejs.org/api/events.html
[uvemitter]: https://github.com/jwerle/uv-emitter
[sparkio]: https://www.spark.io/
[rpi]: http://www.raspberrypi.org/products/model-b-plus/
[corenlp]: https://github.com/stanfordnlp/CoreNLP
[cmusphinx]: http://cmusphinx.sourceforge.net
[marytts]: http://mary.dfki.de/
[nlui]: http://www.wikiwand.com/en/Natural_language_user_interface
[youtube]: https://www.youtube.com/user/TheJackyalcine
[vimeo]: https://vimeo.com/jackyalcine
[spotify]: https://play.spotify.com/user/122054255
[netflix]: https://netflix.com
[voxforge]: http://www.voxforge.org/
[airplay]: https://github.com/juhovh/shairplay
[dlna software]: http://sourceforge.net/projects/minidlna/
[tasker]: https://play.google.com/store/apps/details?id=net.dinglisch.android.taskerm
[tile]: https://www.thetileapp.com/
[wolfram alpha]: http://www.wolframalpha.com/
[owl]: http://protegewiki.stanford.edu/wiki/Protege_Ontology_Library
[google]: http://www.google.com/insidesearch/features/search/knowledge.html
[ontologies]: https://duckduckgo.com/Ontology_%28information_science%29?ia=about
[jarvis]: https://duckduckgo.com/Edwin_Jarvis?ia=about
[qt]: http://www.qt.io/
[boost]: http://www.boost.org
[cmake]: http://www.cmake.org
[zeromq]: http://zeromq.org
[^1]: And that's the tip of the iceberg.
[^2]: My goal is to have the core C++ library for Wintermute working on Android, Ubuntu and Raspbian.
[^3]: As does any developer who realize ANYTHING can be made to be programmable eventually.
[^4]: If you don't test, you'll NEVER KNOW! :fireworks:
