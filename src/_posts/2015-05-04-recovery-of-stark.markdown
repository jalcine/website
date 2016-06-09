---
layout: post
title: "Recovering My Primary Machine"
date: 2015-05-04 04:41:57 EDT
category: thoughts
tags:
  - recovery
  - laptop
  - personal
  - hardware
---

I've designated my current laptop (at the time of writing) `stark`, for its
compact form and beefier specs compared to my older laptops. However, due to a
*really* stupid ploy of mine to keep the laptop on for a super long time, it
seems like its internal HDD[^1] died out on me. SMART data doesn't show
promising information despite it still being able to hold data. I've already
purchased a replacement disk, which so happened to be another Western Digital
disk, but by the will of the digital forces out there, I managed to irrevocably
destroy this disk by dropping it into a kitchen sink. **Don't ask**. So for now,
I'm left using the 32 GB SSD that this laptop came with to hold the operating
system.

I "recycle" my old laptop hard disks by using them for local storage of
photography and video my family and I have taken over the years. However, my
last laptop, `neuromancer`, didn't get this treatment. I completely forgot about
it and deliberated on using it as the new internal hard disk. After chatting
with a friend online about it, it'd make more sense for me to invest in a
high-capacity solid state drive since they aren't prone to gravitational and
long read issue (as far as I know). Samsung's 250 GB SSD is more than enough
space for me since I don't really save much locally[^2] outside of books and
source code.

## Problems I Have Now (And Potential Solutions)

A problem I'm having now is to prevent myself from allowing my machine to be up
for so long without really shutting down. Typically, with `neuromancer`, I made
use of hibernation to just save all of my current activities so it's less of a
cold boot. However, moving to `stark`, I made use of [LUKS][1] which breaks
support of hibernation and leaves your encrypted data for attack in suspension
due to the encryption key for your key being preserved in RAM. I've decided to
more or less give up on suspension altogether since it does have its share of
security concerns.

All in all, this does allow me to continue my digital life as I've sorely missed
it over the last few days. It's hard not having a secure back up to work upon,
especially whilst in the middle of client work. This is something I _did not_
plan for at all and it got me considering investing in a desktop machine for
work that's done at home[^3]. What this begs to interest me in it is having a
"virtual" work environment. It'd just be the act of having a shell I can always
access whenever I'm online and being able to synchronize files and data between
the two. I've already begun to work on something like this[^4] for more CLI
environments but using KDE, I'd want to synchronize my desktop settings
accordingly.

## Tips

**Always** make a backup. The only excuse for not making a backup of your files
is that you wish to have a ephemeral file system. There's quite a few good tools
for those who can host their own setup for backups like [Sparkleshare][] and even
[ownCloud][] itself, if you have a remote server with enough space. I've made do
with ownCloud handling the synchronization of vital files into different
accounts. There's a few other things you'd want to look into like:

  * Backups of key-rings from things like GPG or your password manager[^5]
    helps reduce the frustrating cycle of "reclaiming your accounts".

  * Making use of synchronization services like for Chrome or Firefox help
  out as well.

Live long and prosper!

[^1]: A Western Digital drive, if that matters.
[^2]: Private clouds and on-demand caching FTW!
[^3]: I spend a lot of time outside, either in cafés or libraries. Thus, having my laptop with me is, without a doubt, a must.
[^4]: Currently using a crap-ton of Git repositories via [homeshick][].
[^5]: Please encrypt the password database before moving to another storage medium.
[1]: https://duckduckgo.com/?q=LUKS
[homeshick]: https://github.com/andsens/homeshick
[owncloud]: https://owncloud.org
[sparkleshare]: https://sparkleshare.org
