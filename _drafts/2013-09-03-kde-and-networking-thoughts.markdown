---
layout: post
title: "KDE and Networking - Thoughts"
date: 2013-09-03 07:55:15 EDT
comments: true
category: kde

---

If you haven't noticed from previous screen shots in my weblog, I use [KDE][1] as
my desktop environment of choice. Aside from Chrome, I use mostly KDE software
for my desktop work. It has a really great way of not only working out of the
box, but the feedback and updates (every month!) are great too. I might also
like it a lot too since a lot of the code base is written with C++.

## Information Sharing

However, if there's one thing that does strike me as odd, it's network
information sharing with KDE. Now, the only system that I've seen this done
properly is probably Windows. Whenever you connect to a new network
(specificially wireless, I haven't tried Ethernet connections), it asks for
the network type. Now, some might disregard this window, but this determines
the amount of information that the platform should expose the new network.
If you're a casual Linux user with no real tinkering, not much about your
system is ever visible over the network. However, software like Samba,
ZeroConf/Avahi and others can eventually a bit of a hassle to constantly
switch on and off.

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
+  wlan0 IPv6 neuromancer [dc:85:de:52:29:d1]     Workstation            local
+  wlan0 IPv4 neuromancer [dc:85:de:52:29:d1]     Workstation            local
+  wlan0 IPv6 neuromancer                         Remote Disk Management local
+  wlan0 IPv4 neuromancer                         Remote Disk Management local
{% endhighlight %}

Above, you can see my local network chat capabilities (via iChat for OS X and
 [Telepathy IM][3] on KDE), `sane` used for discovering scanners, machine
 discovery and `udisk` abstraction so I can publish drives over Avahi.
 Talk about some nifty tech! Thing is, I'd have to manually turn these things
 on and off in order to get them hidden from other users. Maybe I don't want
 to want my local chat presence to be visible in some networks but I'd rather
 it to be shown when I'm in others. All of the functionality and logic to
 create "network profiles", or per-network configuration blocks for
 applications is here.

 ## 

[1]: http://kde.org
[2]: http://zeroconf.org
[3]: http://telepathy.kde.org
