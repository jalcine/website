---
layout: post
title: "Introducing An Idea: Shortspeak for KDE"
date: 2014-02-21 15:02:40 EST
categories:
  - projects
  - kde
---

There's quite a few Twitter clients for Linux, more specifically for the GNOME
desktop, and none really catering (and up to relatively modern standards) to
KDE. Thanks to the flexibility of choice and an itch to play with the Twitter
API; I've worked on a dedicated Twitter client using Qt4 and KDE4 APIs. A
few differences between Shortspeak and Choqok are:

 * **Focused on Twitter**: [Choqok][] aims to be flexible with the ability to
   add and remove different micro-blogging services. Out of the box,
   Shortspeak doesn't do this although it'll have the ability to do so once
   Twitter and the streaming nature is down-packed.

 * **Modern extensibility**: As far as I know, you can only extend [Choqok][]
   with C++. I'd want to use [SMOKE][] to extend the application using all of 
   the languages that SMOKE can handle. No reason to constrain it to C++.

Below is a light mock-up of what the main stream view would look like:
![Layout](/images/shortspeak_mockup.png)

The relative layout of the window is fixed to a maximum width of about 
320px; the height's indefinite. The user's avatar is the reference point of
measure; bearing a square of 64px in length. 

[Choqok]: http://choqok.gnufolks.org
[SMOKE]: http://lmgtfy.com?q=SMOKE
