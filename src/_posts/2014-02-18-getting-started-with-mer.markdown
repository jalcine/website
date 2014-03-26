---
layout: post
title: "Getting Started With Mer"
date: 2014-02-18 15:50:32 EST
categories:
  - mer
  - code
---

[Mer][mer] is an operating system designed for mobile phones and it's the one
planned for use for [Plasma Active][plasma_active], the OS I'd like to get
running on my Nexus 4. I've decided to take a dive into building an image for
my phone in hopes of tinkering and writing apps for the device. Let me tell
you; this was *not* easy, at least starting off. Getting the **Platform SDK**,
the SDK required to build the sources of Mer itself, is a bit tricky and isn't
that straightforward IMHO. Note that [there's two SDKs][mer_sdks], get
acquainted to this; it really threw me off at first. In my opinion, it should
be named the **Platform Development Kit**, or a toolchain if anything; but
hey. There's a brief overview on how to get the platform SDK installed on your
computer but I've wrapped it into some helper scripts for those who use
`bash-it`. You can download the [plugin][mer_install_plugin] and
[aliases][mer_install_alias] from my fork of the [bash-it][bash_it] project.
With that intact, all one would need to run to get into the SDK is:

{% highlight bash %}
# mer-sdk-chroot mount
$ mer-sdk-chroot enter
{% endhighlight %}

I've noticed that sometimes when I run this; I get some issues with `su` not
being able to access `/bin/bash`. This hampers the SDK and the only way I've
managed to resolve this is by restarting my system. Right now, I think it has
something to do with my `/etc/fstab` and `mount` but only more experimentation
will tell.

## Moving Forward

With this under my belt, I'm looking forward to continue a little project. One
thing that'd set the biggest chance for Plasma Active would be a means of
ominpresent storage. It's called `KIO::Cloud`, a series of extensions that
would make it easy to connect remotely hosted file services like Google Drive
and Dropbox. KDE's recently added Google Drive API support into the mix so
this would be increasingly easy.

[mer]: http://merproject.org/
[plasma_active]: http://plasma-active.org/
[pdk]: https://wiki.merproject.org/wiki/Platform_SDK#Using_the_platform_SDK
[bash_it]: https://github.com/revans/bash-it
[mer_sdks]: https://wiki.merproject.org/wiki/Platform_SDK#Mer_platform_SDK
[mer_install_plugin]: http://url.jalcine.me/1cnipOn
[mer_install_alias]: http://url.jalcine.me/1kTjAdp
