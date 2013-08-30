---
layout: post
title: "Bugzilla: Work in Progress"
date: 2013-01-04 20:25
comments: true
tags: bugzilla projects-i-like
---

I personally love [Bugzilla](http://bugzilla.org). It's a true example of tried and true
software and it gets the job done. It follows UNIX ideologies down to the bone.
But it's showing its age. It's not really designed for the new Web 3.0 out of
the box (and that's with good reason, it's more on functionality).

This still isn't good. Most modern sites you'd interact with use a lot of AJAX
or a modern MVC framework throughout the platform. This is something I was hoping to see
for Bugzilla as future releases came about.

> From this point forward, I'll be referring to the latest releasde of Bugzilla,
> version **4.2.3**, if memory serves me right.

## Web Stack
I mentioned in my first post a few extensions that could help enhance Bugzilla
to become a really amazing bug tracking tool. But the first thing that has to
be done is quite hard to point out. I'm not quite sure and I have to do a bit
of research, but the minimum version of Perl is going to play a huge role on
what can be done here.

I only bring attention to this largely out of the lack of simplicity when it
comes to starting up an instance of Bugzilla. It's not intuitive at all in my
opinion. This is speaking from a PHP/Zend and Ruby on Rails background so I'm
used to just starting a script in the console and having a web server being
kicked up just for that application. Bugzilla requires that it's run via
another web server, relinquishing that potential to make life a bit easier.
Something like this, implementing a web server, or rather, web application
stack under Bugzilla is something that the core team has to approve on. It's
definitely something that could lead to a forking of a project, though.

## Extension Management
With most extensible software, there's typically a means of going into the server and
maintaining the extensions currently loaded and being used. Bugzilla's system
for building extensions is beyond simple, it's like shit easy to understand and
go about doing. The only issue with that is that it __has__ to be done via the
console, another pet peeve when you're not by the console at the moment. This
provoked me to consider building out a extension that does just that. The lives
of sysadmins everywhere might get a bit easier.

## OAuth and OpenID
The name might say it all to a lot of people. Having to create yet another account
on yet another platform becomes annoying. I personally feel so, at least. This one
still requires a bit of research and testing, though. I haven't had much success with
Net::OpenID::Consumer. For now, I'm going to move to a
[full OAuth solution](http://search.cpan.org/~kgrennan/Net-OAuth-0.28/lib/Net/OAuth/Client.pm)
for now and see if anyone wants to help with the OpenID support.

## Theme Management
Now, the big one. THEMES. I feel like you attempt to retheme the entire monster (gentle)
that is Bugzilla, you'd spend a long weekend doing so. Either we could work on making
something like Persona for Firefox or even a simple tarball to be hosted and extracted
would be awesome. Again, it provides amazing design opporunities for those who want to
make such an awesome tool even more awesome.

## Threads and Comments
Okay. Bugzilla's comments system is cool. Not great, and it's a useful tool. But it leaves
so much more to be done. A bug tracking system of Bugzilla's potential with integration into
VCS systems, IRC and other tools, the commenting system should be awesome as well. I did have
a few ideas for it, but again, purely optimistic. Formatting support for commenting could be
incorporated, but in order for changes like this to occur without messing up too much with
core Bugzilla, the commenting tool would have to be refactored.

## Closing Notes
Well, I'm just looking forward to working more and more this year on Bugzilla. I see a lot of
potential for the tool and I plan to push the use of it in more open source projects in the future.
