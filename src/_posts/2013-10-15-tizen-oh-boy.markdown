---
layout: post
title: Tizen, Oh Boy
date: 2013-10-13 16:25:25 EDT
category: tech
tags: tizen
---

[Tizen][]. It's an operating system currently targeting the mobile landscape
but with (insanely huge) ambitions to move to the desktop and embedded
devices. First off, I think that the ability to have HTML5 applications as
first class apps is awesome. [Ubuntu][] has the same thing going with them and
(I think) further ahead with this since most of the applications that run
under Unity flex well under Ubuntu Touch. I'm obviously a bit split here as
well since [KDE][]'s [Plasma Active][] initiative is something I should be
obviously more interesting in since I'm a KDE user. Alas, when it comes to
mobile devices, at the moment, I'm a heavy Android user. But this is all about
Tizen!

## First Try
I got a [developer preview device][device] from a [hackathon][] I attended the other day
dedicated to building applications for the Tizen operating system. The issues
and problems my team and I ran into were insane. I, for one, was the only pure
Linux developer there that I could find. Others were running in a virtual
machine but none really had the issue (that I was aware) that I had. Off the
back, the ["Tizen IDE"][tizen_ide] was a prepackaged solution of Eclipse[^1].
I wanted to so badly run out of the place yelling "The British are Coming!"
but my team was too cool for me to leave.

I broke in and started playing with the SDK after a few failed attempts to
manually install plug ins into a local installation of Eclipse[^2]. Writing
the application was *quite* straightforward; we used the jQuery mobile boilerplate
that they provided. Then we wanted to use our own JavaScript files hosted
remotely from a CDN. Just getting the device on line was a struggle that
lasted nearly two to three hours, but a small sliver of the issue was due to
the captive portal that our host site had set up in their guest network; so a
drop of slack is given.

[Our app](https://github.com/jalcine/StuffApp) needed to speak with a [Web
service](https://github.com/jalcine/stuffappservice) since we needed to get
information from yet another website and it required some evil logic. There
was probably a way to get in the browser; but it's a hackathon and *ain't
nobody got time for that*. We hacked and we hacked and we barely got the app
looking presently by the time the sixth team went up. Tizen core developers,
make life easier!

## About the SDK
So the [Tizen SDK][] is **not** as open[^3] as the [Android SDK][], but it
comes with a few binaries that you need to use to play with Tizen. `sdb` is
definitely the equivalent of Android's `adb`; it even has TCP debugging (less
cables!) but it's a bit of black magic to set up. When it comes to things like
device logging and what not, `sdb dlog` is your goto man. However, the
filtering is a bit novel (to me) in the sense that `grep` doesn't work as I
intended with it. Nonetheless, it's nice to see how it works with NFC when I
share files and what not over the logging output.

I'm personally going out of my way to *not* use Eclipse as my IDE and instead
attempt to use other solutions like perhaps Qt for Tizen[^4] or just building
and installing from the command line. I'm too used to using Vim for web
application (READ: not web design) development so this would (hopefully) be
received openly.

## Next Steps

From there, I'll plan to do a *lot more* research and toying around with
Tizen's source code and determine not only what parts of it are hidden away
and what kinks it has compared to Android or native application development.

One thing is a fact about Tizen. It has the utmost potential to shift how
mobile application development is done. If we provide websites with mobile
interfaces that can be easily packaged into a Tizen HTML5 application; that's
one less language you might have to learn or hire for (that being Objective-C
or Java). That alone is an interesting prospect. Think of it seriously, web
designers and developers would be more than encouraged to develop web
applications "mobile first" so that the application works as necessary across
the view ports it happens to appear on.

---

Food for thought. Thoughts? Leave it on Twitter. Ciao.

[tizen]: http://tizen.org
[ubuntu]: http://ubuntu.com
[kde]: http://kde.org
[Plasma Active]: http://plasma-active.org/
[device]: http://instagram.com/p/fZYd74HPpo/
[hackathon]: http://agenda.bemyapp.com/events/view/united-states/new-york/huge/tizen-devlab-and-hack-in-new-york
[Tizen IDE]: https://developer.tizen.org/help/index.jsp?topic=%2Forg.tizen.gettingstarted%2Fhtml%2Fdev_env%2Fide_views.htm
[Tizen SDK]: https://developer.tizen.org/downloads/tizen-sdk
[Android SDK]: https://developer.android.com/sdk/
[^1]: [I reacted as any sane person would](http://nooooooooooooooo.com/).
[^2]: Seriously, though. If you guys are using Eclipse, why not just provide a
update site that I can just drop in? I'd love to know what was so impossible
about doing that. I'll be looking into this.
[^3]: Like Android's SDK is released under the OSI-approved Apache 2 license
whereas (I think) the Tizen SDK is opened under the [Flora license](floralicense.org/license).
It's a new one to me too.
[^4]: I'm way more familiar to C++ than to what black magic Tizen's SDK works
with (haven't checked it yet).
