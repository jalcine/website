---
layout: post
title: "xf86-networktablet Packaged in Ubuntu"
date: 2013-01-23 22:45
comments: true 
tags: xorg ubuntu packages projects tablet android
category: projects

---

There's some awesome dudes out there in this big ol' rock. [rfc2822][] had the 
nifty idea of building out a module for [Xorg][] that, in a nutshell, can
turn your Android tablet into a drawing tablet. There's more about it 
on [the blog post he mentioned it][blog_post], if you're curious about the
full round down. I had to make some edits to the original packaging to make 
it a bit niftier for building; tells you what you need to build!

I took the liberty of taking such an awesome project and packing it up into a 
nifty PPA for Ubuntu. For now, it's in my [personal stable PPA][ppa]. 
The source of the Debian packaging for the PPA is [hosted on Launchpad][lp].

After this, you'd need to apply these settings directly by logging off and
back on. That'll be enough to restart the X.org session and load the new
module. The only application so far that seems to even consider the use
of this seems to be GIMP, but there's more practical implications for this. For
example, my Google Nexus seems not to fare well with this tool and instead 
moves the mouse around. Haven't figured out why it does there, but I figured
that packing and sharing would make it something more viable and reveal more
bugs to be fixed.

*Cheers!* Feel free to put your commentary below or tweet me.

[rfc2822]: https://github.com/rfc2822
[xorg]: http://www.x.org/wiki/
[blog_post]: http://blog.dev001.net/post/40681591705/x-org-use-your-android-tablet-as-a-graphics-tablet
[ppa]: https://launchpad.net/~jackyalcine/+archive/stable
[lp]: https://code.launchpad.net/~jackyalcine/+junk/xf86-networktablet-debian
