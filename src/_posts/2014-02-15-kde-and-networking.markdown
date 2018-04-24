---
layout: post
title: KDE and Networking - Thoughts
date: 2014-02-15 07:46:34 EST
revised: 2017-10-08 16:19:36 PDT
comments: true
excerpt: |
  KDE and networking is an interesting space. I try to get into it here.
category: research
tags:
  - kde
  - networking
  - thoughts
---
If you haven't noticed from previous screen shots in my weblog, I use [KDE][1]
as my desktop environment on my Ubuntu desktop. Aside from a few bits of
software, I use mostly KDE software for my desktop work. It has a really great
way of not only working out of the box, but the feedback and updates (every
month!) are great too. I might also like it a lot too since a lot of the code
base is written with C++.

## Peer Discovery
Whenever you connect to a new network on Windows[^1], it asks for the network
type. Now, some might disregard this window, but this determines the amount of
information that the platform should expose the new network. If you're a casual
Linux user with no real tinkering, not much about your system is ever visible
over the network[^2]. However, software like Samba, ZeroConf/Avahi and others
can eventually a bit of a hassle to constantly switch on and off.

Using Avahi to look at my local network over ZeroConf, I get a bit of
interesting information:
{% highlight bash %}
# You must have `avahi` installed for this to work on your machine.
# sudo apt-get install kde-zeroconf (for KDE).
$ avahi-browse -a
+  wlan0 IPv6 Jacky Alcine@neuromancer            iChat Presence         local
+  wlan0 IPv4 Jacky Alcine@neuromancer            iChat Presence         local
+  wlan0 IPv6 saned                               _sane-port._tcp        local
+  wlan0 IPv4 saned                               _sane-port._tcp        local
+  wlan0 IPv6 neuromancer [dc\:85:\de:\52:\29:d1] Workstation            local
+  wlan0 IPv4 neuromancer [dc\:85:\de:\52:\29:d1] Workstation            local
+  wlan0 IPv6 neuromancer                         Remote Disk Management local
+  wlan0 IPv4 neuromancer                         Remote Disk Management local
```
{% endhighlight %}

Above, you can see my local network chat capabilities (via iChat or Adium 
for OS X and [Telepathy IM][3] on KDE), `sane` used for discovering scanners, 
machine discovery and `udisk` abstraction so I can publish drives over Avahi.
Talk about some nifty tech! Thing is, I'd have to manually turn these things
on and off in order to get them hidden from other users. Maybe I don't want
to want my local chat presence to be visible in some networks but I'd rather
it to be shown when I'm in others. All of the functionality and logic to
create "network profiles", or per-network configuration blocks for
applications is here.

## Information Sharing

Now, the concept of just finding other laptops can be annoying. But it's
definitely useful if you don't want to drop a file into Dropbox or Google
Drive just to share (and it's faster). Sometimes just using tools like Samba
(on Linux for access to file servers on other Linux, OS X and Windows
machines) would do. I've always found this to be the best way to send files
quickly especially if you don't want to slow down potential network speeds.
KDE does have an way of incorporating this, but so far it seems to be
only with Samba, for the moment.

{% asset posts/sharing-public-folder.png alt="Sharing a public folder" %}

I'm working to bring other remote document storage solutions like Dropbox and
Google Drive natively into KDE using KIO so it's something to look forward
to in coming months. The code will be available on its 0.1 release sometime in
March.

## Security

Though not installed by default, the KDE configuration module (known as KCM)
for UFW (uncomplicated firewall) is a straight forward tool to setting up and
getting ufw on your system. I have to admit, though, it isn't really friendly
for novice users; it could make do with some template profiles and I've
considered patching it for just this purpose. But outside of that, I can
provide the profile I [use for those interested][4].

{% asset posts/kcm-ufw-shot.png alt="KDE and UFW" %}

It's a old wife's tale about Linux not getting viruses and trojans but it
doesn't happen enough to the casual desktop user of Linux or BSD 
(given our growing size) to not be safe. With `clamav`, one can stay
relatively secure and prevent their systems from known infection streams.

---

When it comes to networking, KDE does it right. KIO is fantastic for
abstracting network resources as a local file system and the use of Avahi and
Samba only further enhances that.

[1]: http://kde.org
[2]: http://zeroconf.org
[3]: http://telepathy.kde.org
[4]: /files/kcm_ufw_default.ufw
[^1]: XP SP2 and greater, I think, and specifically a wireless network, I haven't tried Ethernet connections
[^2]: To my knowledge. I try to harden my personal machine as much as I can, but YMMV.
