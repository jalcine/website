---
layout: post
title: "Kick-Starting Bugzilla with Plack: a PSGI Solution"
date: 2013-03-02T06:07:31-05:00
comments: true
tags: psgi perl plack tutorial bugzilla

---

As mentioned in my landing post, I'm quite the fan of 
[Bugzilla](http://bugzilla.org). It powers bug tracking for Firefox, KDE, 
Eclipse and a lot of other awesome tools out there. Being that Perl is also my 
first web-friendly language and most acquinated one, I decided to provide 
a post on how to get Bugzilla up and running by using 
[Plack](http://plackperl.org).

For those coming from a Ruby background, Plack is the Perl equivalent for 
Rack, a simple server that can be run using Fast CGI execution. This allows 
for direct embedded into other web serves like Apache or Nginx or stand-alone 
uses in a different implementation; the best of both worlds.

## Grab the Source

First things first, you'll have to grab a copy of Bugzilla's source code from 
their website. They store all of their code in 
[Bazaar](http://bazaar.canonical.com), so you should have a client set up 
before preceding. The following code snippets would get you a working copy of 
[a stable build of Bugzilla](http://www.bugzilla.org/download/).

{% highlight bash %}
$ bzr co bzr://bzr.mozilla.org/bugzilla/4.2
{% endhighlight %}

At this time, the installation of Bugzilla is completely up to you. However,
I'd noticed that I was not able to get Bugzilla to start without running
`./install-module.pl --all`.

After that, you'll want to grab the snippet of code that
[Gurunandan Bhat](https://gist.github.com/Bhat-Gurunandan) made 
available on GitHub to run Bugzilla in a local installation.

{% gist 3930079 %}

Copy the code above into the newly branched directory of Bugzilla's code.
Now you can get the show on the road!

## Kicking up Plack

[Plack](http://plackperl.org) is a kickass tool, and it's easy to grab if you
have [cpanm](http://search.cpan.org/perldoc?App::cpanminus) installed. If not,
follow the instructions on
[the manual](http://search.cpan.org/perldoc?App::cpanminus#INSTALL) or
install Plack the same way you installed the modules for Bugzilla
(recommended).

Once you have those files, you're ready to start up Bugzilla.

{% highlight bash %}
$ plackup --host=127.0.0.1 --environment=production
{% endhighlight %}

That's all there this to it! You now have Bugzilla up and running via Plack.
