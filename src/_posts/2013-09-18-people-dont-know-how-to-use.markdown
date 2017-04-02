---
layout: post
date: 2013-09-18 07:21:06 EDT
title: People Don't Know How To Use My Laptop
category: observation
---

Over the last few days, I've been letting my laptop fall in the hands of other
people for showcasing and entertainment purposes. You know, the occasional
"checking of Facebook" or "lemme see that code?". It's been very amusing since
how people accidentally open a can of worms. A bit of background, I use
[Kubuntu][1] on my laptop with a self tweaked kernel for power saving options,
hardening and security[^1]. The window manager[^2] I use is the de facto of
KDE, KWin. It has a lot of bells and whistles and I try to use only as much as
I need like per application window switching, no thumbnails for windows at
all, etc. The environment has this nifty features called "Screen Edges". It
allows me to trigger actions whenever I hit a corner or edge of the screen.

![Screen Edges on KDE](/images/show-me-screen-edges.png)

For my setup, I have the following enabled:

* "Present Current Application Windows for Current Desktop" when you hit the **center top of** the screen,
* "Show Dashboard Widgets" when you hit the **top right of** the screen,
* "Present Windows for All Desktops" when you hit the **bottom left of** the screen and
* "Present Windows for Current Desktop" when you hit the **bottom right of** the screen

The difference between the "Current Application Windows" and just "Windows" is
that the former shows every single window open for a *specific application*
whereas the latter show only the *most recently used* window for *each*
application on a said desktop. It comes in handy when you have dozens of
terminal, browser, and vector image editing windows open.

## "The Horror!"

Now, a friend of mine and I were [watching][2] [a few][3] [videos][4] on
YouTube. She meant to raise the volume, but didn't hold `Fn`. This causes my
drop down terminal appear. She ignored it and just clicked back on Chrome. 

This time, she moved the cursor to the top of the screen. Wham! Windows for
days since I was on my "Social" desktop, you had Facebook, Hacker News, my
personal [RSS reader][5][^3], dozens of dedicated windows for Ars Technica,
Phoronix, The Verge, it goes on. She called me over and asked for help. 

## The Thing

You might wonder why can't I just keep things simple and just have a regular
setup (or just a Mac™). I can't tweak OS X the way I can with my laptop, I've
tried. And being fiscally disadvantaged, I can't see why I'd pay $5 for window
tiling and snapping, it doesn't just add up to me. Of course, each set up is
(hopefully) as unique as its user/owner so that's that.

[^1]: I might post about this when I feel more confident with the process.
[^2]: For the not knowing, **window managers** are applications that tell other applications where they are on the screen.
[^3]: A antisocial reader powered by Stringer.
[1]: http://www.kubuntu.org
[2]: https://www.youtube.com/watch?v=tatw6W7vHLM
[3]: https://www.youtube.com/watch?v=VXgWl3hJ4ns
[4]: https://www.youtube.com/watch?v=CSJ1mVpk-FI
[5]: https://github.com/jalcine/stringer
