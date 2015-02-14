---
layout: post
title: "Oa: My Sovereign Setup"
category: devops
date: 2015-02-07 10:56:59 EST
tags:
  - oa
  - personal-infra
---

![That's how we roll.](/images/im2-rdj-your-welcome.gif){:style="height: 12.5rem; width: auto; display: flex"}

In my [last post][], I mentioned my want to build up a digital infrastructure
of my own. After a bit of reading up on how [Ansible][] worked, it being the
best for this kind of work, I managed to have it up and running. The feature
list of things I have set up are [hosted on cgit][1]. This is going to be
something I plan to have grow (as yet another personal project). A few things
to note would be that:

  * All of the Web requests from my other domains like **jalcine.me** and
  **jacky.nyc** are now automatically routed to **jacky.wtf**. This is done
  in part of a vanity reclaiming for me and it looks a _lot_ saner in the
  logs. And of course, **jacky.wtf** is incredibly more memorable.

  * I'll be sending **less mail from Google's email servers**. Initially, I
  want to see how much load and work it'd take for me to handle a portion of
  said emails and to see what's emailing my Google email address directly.

One thing I did find really cool to have since I might end up using Github
less was being able to set up [git-achievements][]. It's also nice to have
stats on habitual tools to see where efficiency can be made. It's held over at
[its own page under cgit][2]. Another thing that I might miss quite a bit is
the ability to handle post-receive hooks for certain repositories like the code
for the blog or maybe even to handle re-provisioning of the nodes for Oa
itself. Also, since Github doesn't support Git mirrors[^1], I'll still have
projects like [cmake.vim][] and [wintermute][] held on Github but have
mirrors held on `git.jalcine` because yay[^2]!

Also, now I can have a development version of this Website. I always wanted to
test out things under the proper vanity URI like `next-www.jacky.wtf` so that
the code stored at the [`develop` branch of the site][devsite] would be visible
there and have the code at the [`master` branch of the site][massite] be
visible at `jacky.wtf`. The little things to make me happy; like doing W3
validations against the remote service or checking if oEmbed links work
properly can all be done with this.

With these out of the way, I'd say there's room to do a few more things. I've
wanted to build a *free/busy* page so if someone wanted to email me or just
reach me, they can do so without too much worry of interrupting my current
activity. This would be a bit easier to implement with more control over my own
internal calendar and what not[^3]. It'd be great if I could actually push up an
optional message about my current pre-occupation. **Yay for sovereignity**!

[last post]: {% post_url 2015-02-06-going-sovereign %}
[ansible]: http://www.ansible.com/home
[git-achievements]: https://github.com/icefox/git-achievements
[cmake.vim]: https://git.jacky.wtf/cmake.vim.git/about
[wintermute]: https://git.jacky.wtf/wintermute.git/about
[1]: http://git.jacky.wtf/oa.git/about
[2]: http://git.jacky.wtf/git-achievements/about
[devsite]: http://git.jacky.wtf/website.git/about
[^1]: Way to support everything _but_ one of the coolest parts of Git :frowning:
[^2]: There's no reason to yay :frowning:.
[^3]: Upcoming projects!!11
