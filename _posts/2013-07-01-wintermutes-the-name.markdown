---
layout: post
title: "Wintermute's the Name, JARVIS's the Game"
date: 2013-07-01 21:14
comments: true
tags: personal-goals jarvis iron-man wintermute

---

When people ask me what I do, I almost always reply with the sentence, "I'm 
a full stack web developer". It's not a lie, but it's only what I do because
it helps me pay the bills. That might read wrong to some people, but web 
development has taught me a lot about remote system management and database
management, so it has an immense value-add to my end-goal.
<!-- more -->

> Before continuning, I strongly recommend becoming acquainted with 
> [JARVIS](http://en.wikipedia.org/wiki/Edwin_Jarvis).

![Tony shopping on Amazon.](http://25.media.tumblr.com/tumblr_m42tdvzs3M1qmr448o1_r1_500.jpg)

**Jarvis** is practically and not yet entirely what I want to build out of an 
self-replicating operating system. That was the biggest aspect of the 
platform; it has to be able to spread itself whenever necessary. In 
conjunction to that, it has to understand how far it spread out. It needs to 
know its environment and what it's capable of doing in said environment. It 
also needs a level of grasping context. I originally called it *Taylor*, but after
a recommendation from a friend; the name's **Wintermute**.

## Run, Forest, Run
The one thing about computers that make them so useful to us is their 
adbundance. One computer on the planet wouldn't be able to hold Facebook, 
Google, and Microsoft. But farms and farms of them can and have them run 
insanely fast. There's all of that good and juicy stuff like remote procedure 
calling, shared memory and core processing clustering. All of that are things 
I'd want to incorporate into the foundation of this "big idea" of mine.

![A Internet of Things](http://i2.cdn.turner.com/cnn/dam/assets/130502212037-internet-of-things-graphic-story-top.jpg)

Another reason for multiple computing units is also for I/O. The platform 
should be able to recieve data from a multitude of locations and 
(re)distribute it across those same devices. Think of this as a way of 
creating many faces for one person. The simplest point of entry would be 
a microphone and speaker system. Both devices would be connected to a small 
computing unit whose sole purposes is to directly route that captured audio to 
a capable machine for parsing said raw audio and a device that can play back 
said device without much difficulty. That could be considered the simplest 
form of a human interfacing unit. An extended version would allow for a RCA 
jack to permit more capable devices to extend the functionality of the device. 
A key aspect of the physical (and digital) components of this project is that 
everything is extensible. Extensibility can ensure greater form and function, 
in my opinion; correct me if I'm wrong.

## Understanding its World
The following text is going to be heavily opinionated. And it's on the (little)
research that I've done about knowledge representation and intrepretation in computing.

There's three aspects of the building blocks of usable attributes we collect from our 
environment. They're in the form of **data**. Data, when joined with other bits of data,
becomes **information**, and when information is used in a specific **context**, it becomes
**knowledge**. My (extremely debateable) definition of each word is as follows:

  * **Data** represents what we can consider simple attributes. Things like
    "Hair grows on heads" or "Water is wet" would be considered data. It's 
    storable and forms relationships between two objects. Objects can be literally
    anything, and wrapping that around my head is still something I can't fully grasp myself.
    But it works.
  
  * **Context** represents an environment of constraints where specific bits of data cause
    other specific bits of data to be modified, spawned, or cease to be. From a programming
    perspective (specifically Python or Ruby), consider it `virtualenv` within `tmux` within `xterm`.
    Each layer sets its own version of the environment and tweaks it for specific events and actions
    to occur.

  * And a whole bunch of other stuff that I don't know yet but would hopefully 
    understand in the future.

## Building Wintermute
Right now, I'm rewriting the basis of the Wintermute platform. It's a bit 
weird how I have it envisioned but it's something like this. Wintermute would 
start up in the background, right before the desktop shell is loaded or the 
login manager, probably even before X is started. For now, it's started from 
the console within a X session. Like a typical extensible application,  it searches
for a core instance lurking about and starts one if none exists. It loads 
extensions and then falls to the background, only acting when requested.

Now, the function of it really exists within the plug-ins. The way I saw it, 
Wintermute has three extensions that are vital for its operation, the 
`DataApi`, `NetworkApi` and `LinguisticsApi`. From the names of those 
libraries, a bit can be dervived.

### Data in Wintermute
One of the biggest plagues in software applications are object document 
mappers (or relational mappers, if that's your fancy). What I'm aiming to do 
is store data abstractly. It's going to cause a tiny overhead problem since 
everything will need a middle format, but it'd allow for a plethora of data 
storage solutions like Mongo, MariaDB/MySQL, or even a REST API. It's still in 
the flux of development.

## Networking with Wintermute
Now this is the fun part. One theme of Wintermute is to make protocols and 
barriers as invisible as possible. Data and communication should be able to 
occur everywhere. So with networking, I initially had the idea of having 
listening sockets on every kind of socket (ICMP, UDP, TCP, ARP). Obviously, 
this wasn't too much of a good idea due to my lack of knowledge of how to tame 
this things and since connections can be abstracted away only so far. For now, 
my solution to this might be implementing a central hub that represents 
a central stream of data and have workers that connect and translate data 
accordingly. I figured this to be way more efficient so that if data drops on 
UDP, we could attempt to reestablish a connection via TCP. I also saw it as 
a way to introduce more native communication protocols like serial 
communication and Bluetooth. Awesome!

## Linguistics
Now, this is my bread and butter of Wintermute. Probably the most experimental 
part of the entire application, I'd attempt to build a hot-swappable 
semantically accurate linguistic engine using the theory of link grammar. The 
only issue with this is that some languages like Farsi won't work with it. 
Since I don't know it, I'm not stressing it too much, but I do hope that 
someone would come along and help with it.

----

That's my idea. What do you think? Lemme know!
