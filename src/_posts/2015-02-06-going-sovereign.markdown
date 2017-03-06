---

layout: post
title: "Going Sovereign: Reclaiming my Digital Independence"
category: development
date: 2015-02-06 10:53:15 EST
tags:
  - goals
  - development
  - projects

---
There's something I've wanted for quite some time and I didn't know why it was
so hard for me to get off my ass to get it done. I kept seeing it whilst
looping Iron Man scenes on my second monitor and it was a personal _digital_
workstation. You see, my laptop's tweaked to my liking and works in such a
fashion where I think I work even better because of said modifications. I have
yet to document said changes but it works (for me, quite well). [Github][] is a
really popular place to store code, but outside of _really mainstream_
projects and for ease of collaboration, I don't see the point of me hosting
code _there_ when I can do it myself. Don't get me wrong, if it's something that
I think that can be worth publishing out to the public then I'll do it. But
y’all don’t need to see _all_ of my magic.

![He's crawling out!](/images/cat_scratch_snow.gif){:style="width: 400px; margin: 0rem auto; display: flex"}

Before I really start, I had to understand what it was that I wanted a few
things from the following. No reason to build shit all willy nilly.

## Git Repositories {#private-git}
In an attempt to remain organized, I throw all of the projects that I've
checked out using any VCS and threw it into a single folder. With a little
`wc`, that made a rough count of about 190 projects I have checked out at
once on my machine[^1]. I probably active touch a tenth of those on a weekly
basis. Half of them, though, are typically projects that aren't meant to
see the light of day, like my laptop's configuration setup or the Git
index of my digital book collection. Having hosted Git repositories would
allow me to push all of the things as my own private backup service. :dizzy:

## Re-enabling Comments {#comments}
I've been sitting on this for quite some time, to set up my own instance of
a commenting platform for use with my site. Having this pre-configured and
ready to roll would make quite a few things easier. The tool in question
would be [Isso][] and I'd probably lock it to be only Twitter authentication
if not hard-moderated. Comments _can_ be useful, just from well meaning people.
I wouldn't want to make it too hard for said people to comment on the blog
however so comments, it is. Pretty sure I [broke a rule somewhere][atwood1].
I have to admit, the enabling of said comments will be very sparingly since
most posts tend to be affirmations and confirmations of sorts, not really
a open-ended story. I do, however, like the idea of having discourse on shared
ideas on this blog (and others). The ecosystem for POSSE (post on [your] site,
share everywhere) feels better for one’s brand and authencity to grow.
Unfortunately, our social gardens are making that harder and harder.

### Data Storage {#data-storage}
[Dropbox][] and [Google Drive][gdrv] are some dope ass products. Like amazing.
However, for the sake of privacy, I'd want to stash the files I use everyday
but not with others in a silo and _not_ lose that control. The obvious answer
to this would be [ownCloud][] and it seems to be the most popular but I'm
still up in the air for other options. Something that can handle [PIM][] and
file storage would be the goal, though.

One of my bigger concerns would be handling my picture storage. I wouldn't
want to stash it all on a remote server since that can get considerably
expensive fast ($5 for 20 GB of space and I have currently about 60 GB of
images and footage).

## Private Build Server
The biggest reason why I haven't left Ubuntu for Debian yet is largest because
of the PPA infrastructure that Ubuntu has wrapped around building packages
outside of the ones provided in the default repositories. Having something
like [Drone][] to handle automatic builds for new software releases like
[Vim][], it'd be dope to have a private PPA system to handle this.
Realistically, I wouldn't bother with this because [Launchpad][] does a really
good job of that. What I _would_ use this for would be [Wintermute][]. Having
it built automatically and then pushed out to machines that are listening for
its updates would be dope. Also, there might be some bits of Wintermute that I
want to be deployed onto machines but not necessarily available to the public
:smirk:.

The biggest motivation for this probably is for accessibility and full control
of said data in the event I want to leave said services. I've already made
plans to deactivate dozens of my current accounts on the Web and in order to
efficiently do so, I'd have to have a replacement system that can keep me as
productive as the one prior did.

Thanks to [Ryan][], I have a very small basis on which I can get this started
with as well as interesting projects like [`sovereign`][] that expand to
include e-mail and other dope stuff. This, plus a few other projects are going
to occupy a lot of my free time over the month of February. Excited to start!

[github]: https://github.com
[pass]: http://www.passwordstore.org/
[isso]: http://posativ.org/isso/
[dropbox]: https://dropbox.com
[gdrv]: https://drive.google.com
[pim]: https://duckduckgo.com/Personal_information_management?ia=about
[owncloud]: https://owncloud.org/features/
[atwood1]: http://blog.codinghorror.com/a-blog-without-comments-is-not-a-blog/
[wintermute]: https://jalcine.github.com/wintermute
[launchpad]: https://launchpad.net
[drone]: https://drone.io
[vim]: https://vim.org
[ryan]: http://rix.si
[`sovereign`]: https://github.com/al3x/sovereign
[^1]: After a little fun messing up LUKS, that number's dropped down to less than 20.
