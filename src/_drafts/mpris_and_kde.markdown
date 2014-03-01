---
layout: post
title: "MPRIS and KDE Playing Nice"
date: 2014-02-23 12:28:08 EST
categories:
  - kde
  - mpris
  - code
---

I use [KDE][] and I have a collection of music playing as well as video
playing applications on my machine (sometimes running at the same time, but
not playing). For example, I might have [Amarok][] open when I'm offline to 
play my offline collection of music and listen to podcasts as well; but 
switch to [Spotify][] when I get reconnected to play the tracks I have 
in my Spotify collection. The only issue here is that my media control keys
are currently hard-wired to work with Spotify (since I spend quite a bit of
time online). That's changed and I've been spending more time offline 
in order to encourage me to go online when necessary. Thus, came the idea of
creating a sort of multiplexer for all of the `org.mpris.MediaPlayer2`
services there is.

 * **TODO** Speak about the UI for the multiplexer. It should use QML/Plasma.
 * **TODO** Speak about hooking it into KRunner's system via a plug-in system
 * **TODO** Provide a notification icon for the application to embed into the
   status bar.
 * **TODO** Provide a plasma widget to show statuses of playing files.

[kde]: http://kde.org
[amarok]: http://amarok.kde.org
[spotify]: http://spotify.com
