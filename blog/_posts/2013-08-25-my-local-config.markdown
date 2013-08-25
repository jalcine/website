---
layout: post
title: "My Local Configuration"
date: 2013-08-25 10:33:02 EDT
comments: true
tags: bash config
---

If there's one thing you can do right, it's setting up your local console
environment. Casual users typically don't have to replace their computers
every few years; but developers tend to upgrade every year and half or so (if
budget permits). There's other reasons for versioning your shell environment; 
in my case, for using it in virtual machines, remote serves or if you nuke
your system.

## Pick your Rodeo

The tool I'd recommend for such an endeavour is `[homeshick][1]`. It's a
Bash-implementation of the Ruby gem `[homesick][2]`. It does take a bit more
time to set up than its Ruby counterpart, but consider this: if you have to
install Ruby on a new system, install `homesick` and then use a local tool for
versioning Ruby like `[rbenv][3]` or `[rvm][4]`, then why bother installing
system Ruby? It looks like a chicken and egg (or rather rooster and hen)
situation. Install this tool to your local system by executing the following:

[1]: https://github.com/andsens/homeshick
[2]: https://github.com/technicalpickles/homesick
[3]: https://github.com/sstephenson/rbenv
[4]: https://rvm.io/
