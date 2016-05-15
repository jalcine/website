---
title: "Clawing Back Privacy, One Piece at a Time"
date: 2015-03-04 03:18:57 EST
layout: post
category: sovereign
tags:
  - git
  - owncloud
  - in-house
  - privacy
---

I've spent some time every night working on a few in-house builds of software
like [cgit][] and [ownCloud][] that'd allow me to have some control over
software I'd like to use everyday like [GitHub][] and [Dropbox][] but don't want
to leave in the control of others. Of course, since not everyone wants to
consider reclaiming their digital warehouses, despite it being increasingly
cheap and easy to do so, I've had to take some considerations into allowing some
"holes" into the system to allow people to connect to some of this data.
Realistically, there won't be much out-facing changes for those who tend to
interact with me on a daily basis. I'd still be commenting on GitHub issues like
a mad man and keep up the starring streak. Email might be the more tricky thing
since I didn't realize how many places I've thrown my email at[^1]. The public
facing version of cgit is over at <http://git.jacky.wtf/> for those interested.
I'm debating making some patches to it to allow for some more features like
whole page templating and the likes, but if that doesn't work, I'd begin to
wonder if this would be a nifty project to implement in Go :grin:. Take some
time and check out your [Google dashboard][1] if you have a Google account.
Click the Expand button and scroll as you see how much information is collected
about you. Things like [the devices you've signed in from][2], the things you've
[synced into your Chrome browser][3] and of course, your [location history][4]
from **all** of your Google-enabled devices[^2].

[^1]: We need to fix this email problem **fast**.
[^2]: I don't think this is restricted to Android.
[1]: https://www.google.com/settings/dashboard
[2]: https://security.google.com/settings/security/activity?hl=en&pli=1
[3]: https://www.google.com/settings/chrome/sync
[4]: https://maps.google.com/locationhistory
[owncloud]: https://owncloud.org
[cgit]: http://git.zx2c4.com/cgit
[github]: https://github.com
[dropbox]: https://dropbox.com
