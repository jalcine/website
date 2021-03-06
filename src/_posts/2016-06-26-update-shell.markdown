---
layout: post
title: Updating My Shell Configuration
date: 2016-06-26 11:06:26 PDT
image: snapshot455.png
excerpt: >
  I use the terminal a lot. I also use different operating systems a lot.
  Here I talk about how I've managed to handle these shifts and how I'm
  excepting the future of my shell configuration will look like.
category: shell
tags:
  - bash
  - tooling
  - personal
  - env
---

If there's one thing I spend a good amount of time in, it's my terminal
emulator. Or shell. Or prompt. Whatever. For me, it's [**konsole**][1].

I write my blog posts, journal, chat with people and do a _lot_ of my code
editing from this place. Of course, some things I do in other applications like
Firefox or an IntelliJ-based IDE[^1] but even then, those applications tend to
have experiences tailored for a user who's a bit like me: spending loads of time
in Vim and swapping I/O between panes.

My leaning to Vim and tmux isn't something of a religious thing - though I do
joke in that favor. It's more so of a feeling of efficiency. I occassionally hit
`ESC` whilst in text entry fields on the Web out of habit - Vim uses that key to
denotate the exiting of the current editing state (INSERT) into one of its modal
one (NORMAL).

## Getting Them On My Machines

Alas, whilst working at [Clef][] and side projects, the needed differences in my
personal laptop's configuration and my work machine has forced me to consider
creating multiple sets of configuration for each one. Initially, I made use of a
[Bash-based framework for this][2] but in my efforts to get a better
understanding of Bash itself and the nuances between macOS and Ubuntu, I've
removed it from my configuration and made my own.

The splitting away mentioned before led to a bunch of "smaller" repositories
that I use for focused aspects of life. At the time of writing, the repositories
that I have (all hosted on Github):

  * [dotfiles][]: Holds the core components. 
  * [kderc][]: [KDE][]-specific aspects.
  * [osxrc][]: macOS-specific aspects.
  * [vimrc][]: Vim-related files and configuration.
  * [gitrc][]: Git addons and base configuration.
  * [tmuxrc][]: Tmux-based configuration.

Each of these repositories are [homes(h)ick][]-powered repositories. This allows
me to run something like:

{% highlight bash %}
$ homeshick clone git://github.com/jalcine/dotfiles
{% endhighlight bash %}

That command would clone and link the configuration stored in `dotfiles/home`
at my `$HOME` directory. There's a matter of _unlinking_ files that hasn't been
solved yet but for the moment, I have a few broken symbolic links that are
harmless.

## Getting My Language Tools In There
I work with quite a few languages. Languages like JavaScript and C++ have become
my bread and butter, as well as Python and now Rust. Other languages like
Elixir, Swift[^2] and PHP are either hanging around or things I'm trying to get 
a better hold of.

[^1]: This is usually as a last-resort, in the case of Android.
[^2]: [Yes, you can run swift on Linux.][3]
[1]: http://konsole.kde.org
[2]: https://github.com/Bash-it/bash-it
[3]: https://swift.org/blog/swift-linux-port/
[clef]: https://getclef.com
[dotfiles]: https://github.com/jalcine/dotfiles
[kderc]: https://github.com/jalcine/dotfiles
[osxrc]: https://github.com/jalcine/osxrc
[vimrc]: https://github.com/jalcine/vimrc
[tmuxrc]: https://github.com/jalcine/tmuxrc
[gitrc]: https://github.com/jalcine/gitrc
[homes(h)ick]: https://github.com/andsens/homeshick
[kde]: http://kde.org
