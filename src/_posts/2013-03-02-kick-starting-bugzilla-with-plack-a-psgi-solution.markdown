---
layout: post
title: "Kickstarting Bugzilla with Plack: a PSGI Solution"
date: 2013-03-02T06:07:31-05:00 -0500
comments: true
tags:
  - psgi
  - perl
  - plack
  - tutorial
  - bugzilla
category: projects

---

As mentioned in my landing post, I'm quite the fan of 
[Bugzilla][]. It powers bug tracking for [Firefox][], [KDE][], 
Eclipse and a lot of other awesome tools out there. Being that Perl is also my 
first web friendly language and most acquainted one, I decided to provide a post
on how to get Bugzilla up and running by using [Plack][].

For those coming from a Ruby background, Plack is the _Perl equivalent_ for 
[Rack][]. This allows for direct embedded into other web serves like Apache or
Nginx or stand alone uses in a different implementation; the best of both
worlds.

## Grab the Source
First things first, you'll have to grab a copy of Bugzilla's source code from
their website. They store all of their code in Bazaar, so you should have
a client set up before preceding. The following code snippets would get you
a stable copy of Bugzilla 4.2.

```bash
$ bzr co bzr://bzr.mozilla.org/bugzilla/4.2
```

At this time, the installation of Bugzilla is completely up to you. However,
I'd noticed that I was not able to get Bugzilla to start without running
`./install-module.pl --all`.

After that, you'll want to grab this snippet of code that [Gurunandan
Bhat][1] made available on GitHub to run Bugzilla in a local installation.

{% gist 3930079 %}

Copy the code above into the newly branched directory of Bugzilla's code.
Now you can get the show on the road!

## Kicking up Plack

[Plack][] is a useful tool, and it's easy to grab if you have [cpanm][2]
installed. Once you have those files, you're ready to start up Bugzilla.

```bash
$ plackup --host=127.0.0.1 --environment=production
```

That's all there this to it! You now have Bugzilla up and running via Plack.

[bugzilla]: http://bugzilla.org
[firefox]: https://bugs.mozilla.org
[kde]: https://bugs.kde.org/
[plack]: http://plackperl.org
[rack]: http://rack.github.io/
[1]: https://github.com/Bhat-Gurunandan
[2]: http://search.cpan.org/perldoc?App::cpanminus
