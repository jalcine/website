---
layout: post
title: "Ambitions for Wintermute"
---

> [Wintermute][] is a fickle project. One so complex, I legitimately forgot my
> objective whilst working on it. This entry is going to serve as a means of me
> keeping track of the end goal.

Wintermute is an attempt to build a "universal" communication platform for
existing and future bits of software. The idea is that if it can communicate
over the network or between processes on a local machine; Wintermute can use it
and make it work in its favor. The [core library][wintermute] is meant to be
the foundation that hides a _lot_ of the platform-dependent nuts and bolts and
make things like remote procedure calling, extension support & discovery and
whatever that should be handled by the core instance of Wintermute.

From here, things get interesting. Wintermute's built with extensibility as a
first class citizen. So having something like a extension that can manipulate
your desktop environment is not only viable, but absolutely necessary for
Wintermute to have a decent sense of control over it. The following are a list
of extensions that I've planned to build for Wintermute:

  * `wintermute-kde-plasma`: Provides control over the Plasma Desktop.
  * `wintermute-kde-akonadi`: Allows fetching of information from [Akonadi][].
  * `wintermute-voice-pocketsphinx`: Incorporates the speech recognition tool
    [PocketSphinx][] to Wintermute.
  * `wintermute-voice-google`: Incorporates the unofficial API for Google
    Speech via Google Translate to Wintermute.
  * `wintermute-nlp-mitie`: Incorporates [MITIE][] to determine named entities
    in phrases pulled in for natural language processing.
  * `wintermute-nlp-stanford`: Adds [Standord's CoreNLP][scnlp]

[wintermute]: https://github.com/jalcine/wintermute
[akonadi]: http://kde.org
[pocketsphinx]: http://sourceforge.net
[mitie]: https://github.com/mit-nlp/MITIE
[scnlp]: http://nlp.stanford.edu/software/index.shtml
