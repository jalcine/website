---
layout: post
title: "My Stuff"
description: |
  I noticed how people _love_ talking about their shell. I've decided to
  make a quick lil' post about the such. Again.
category: site
tags:
  - personal
  - shell
  - development
---

I've written before about my [shell][] setup and it was mildly comprehensive in
what I used from Vim to even my desktop environment. But now, I've noticed
something a bit disconcerting. I tend to update said files almost once every
two days and updating my blog at the same time is a bit insane. So, what I've
decided to do is incorporate the `README` files for said repositories _into
the site_ itself! Not only does the site get the benefit of up-to-date
information, this gives more incentive to standardize how I document my shell
configuration and make it more accessible for those who just don't understand
[why `gca` works][gca] or [why`ls` looks _nothing_ like GNU `ls`][different_ls].

Before any of this can happen, a few bits of :sparkles: magic :sparkles: 
have to be incorporated into the code tree for any of this to happen. It'd
require a tweaking of [Git hooks][githooks]. By default, you can't check in the
`.git` folder so using a [project to handle Git hooks][githooksprj] helps to
set it up. With that set up, I can have dope commit hooks whenever I switch to
a particular branch, successfully commit a message or push up to a remote
location.

[shell]: /weblog/dotfiles/
[gca]: #
[different_ls]: #
[githooks]: http://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks#Client-Side-Hooks
[githooksprj]: https://github.com/icefox/git-hooks
