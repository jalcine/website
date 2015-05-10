---
layout: post
title: "Using Owncloud: A Month In Review + Extra"
category: sovereignty
tags:
 - owncloud
 - wallabag
 - sovereign
---

I've been using :cloud: [ownCloud][] to handle my contacts and calendars recently in
(very high) hopes of moving away from using Google for all of my calendar and
contact purposes. So far, it's been working out pretty well. I have quite a
few applications installed on my instance handling files and RSS as well! :smile:

![ownCloud's file page](/images/owncloud-landing.png)

The nifty thing is that it has a Android client for file synchronization so I can
take a picture or video on my phone and it syncs over to ownCloud and gets on
my laptop as well, very similar to Dropbox's sync[^1]. When it comes to the
calendar application, it looks like exceptions to dates don't reflect well on
the Web interface despite it looking fine on my laptop when I use [KOrganizer][].
With the tasks application for ownCloud, I can finally move away from [Wunderlist][]
and get to working on things locally. There isn't a default task application for
ownCloud but there's [Mirakel][][^2] which supports both CalDav and [TaskWarrior][].

It's been pretty enjoyable so far. The default theme is beginning to become
a bit of an eyesore though, so I think I might work on making a new one (I don't
see many themes for ownCloud to begin with so it might be worth looking to). I
don't intend to use ownCloud from a mobile web browser personally but the
default theme is mobile Web friendly. So far, most of the applications for
ownCloud seem to take advantage of the responsive nature (or ownCloud does a
decent job of chopping up UI elements for applications).

![ownCloud's activity stream on mobile view](/images/owncloud-activity-mobile.png)
{:style=>"height: 300px"}

It's also empowering to know that you can really take back a lot of these
services you like (or need) to use and even enhance the tools to work in your
favor. Running through some of the issues for [the core of OwnCloud][1] as well
as the [News app][2] and the [Calendar app][3], there's definitely loads of
room for improvement; if you're into working on PHP code, that is. There's
always the concern that this might be a bit work for some to take on, having
now a few services that you have to coddle like infants[^3] but with the right
tools, it becomes less of a burden :facepunch:. I think my only concern now
with ownCloud might be handling storage.

## Setting Up Owncloud

I took the easy way out of setting up [ownCloud][] and decided to leverage
[ownCloud's OBS for Debian][5] to handle the installation of it on my server. I'm
planning to move to a source code build since I plan on running specific
patches of the software myself. All of the provisioning logic for ownCloud is
handled by [Ansible as part of my sovereignty setup][6]. In a nutshell, I've
used nginx and PostgreSQL to handle and store ownCloud's data. If there's any
particular questions about how to use [Oa][], feel free to hit me up about it.
As for ownCloud, I'm going to dabble more into making its News app work with
[Wallabag][], right now it has flaky support in Firefox :weary:.

## Leaving My Shell

One question that I figure that might arise is how does one manage calendar
sharing with ownCloud? I'd say that it's up to the client to handle things
like that. I've already taken the initiative this year to use my laptop to
handle invitation acceptances and the likes, but this is definitely
something that might break over time. The ability to share your contact
information between people is a bit haphazard and I don't actually
understand how Google gets its down outside of a lot of ACLs and
synchronized CalDav instances.

All in all, if you want to mess around with ownCloud and getting it up and
running, why not [a month free on a VPS][7] and try it yourself[^4]? Only
thing you can lose is time (though that's expensive for some).

[^1]: There's still one thing to be ironed out; [LAN sync](https://github.com/owncloud/client/issues/230) :dancers:.
[^2]: There's a few kinks that need to be hammered out by [Mirakel][] though :cry:
[^3]: Why you no use [monitoring services][4]?
[^4]: This post isn't sponsored by DigitalOcean, but they're dope as hell so free promo!
[owncloud]: https://owncloud.org/features/
[korganizer]: https://userbase.kde.org/KOrganizer
[wunderlist]: https://www.wunderlist.com/
[mirakel]: http://mirakel.azapps.de/
[taskwarrior]: http://taskwarrior.org/
[wallabag]: http://wallabag.org/
[oa]: http://git.jacky.wtf/oa
[1]: https://github.com/owncloud/core/issues?q=is%3Aopen+is%3Aissue+label%3A%22Junior+Job%22
[2]: https://github.com/owncloud/news/issues?q=is%3Aopen+is%3Aissue+label%3A%22Pull+Requests+Welcome%22
[3]: https://github.com/owncloud/calendar/issues?q=is%3Aopen+is%3Aissue+label%3A%22Junior+Job%22
[4]: https://mmonit.com/monit/
[5]: https://software.opensuse.org/download/package?project=isv:ownCloud:community&package=owncloud
[6]: http://git.jacky.wtf/oa/tree/roles/cloud/tasks/owncloud
[7]: https://www.digitalocean.com/?refcode=7db9600b0820
