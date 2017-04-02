---
layout: post
title: "My Local Configuration"
date: 2013-08-25 6:33:02 EDT
comments: true
tags:
  - bash
  - configuration
excerpt: |
  It’s always good to keep track how your personal environment plays out.

---

If there's one thing you can do right, it's setting up your local console
environment. Casual users typically don't have to replace their computers
every few years; but developers tend to upgrade every year and half or so (if
budget permits). There's other reasons for placing your shell environment under
version shell; in my case, for using it in virtual machines, remote serves or if
you nuke your system.

## My Setup

I use quite a lot of junk, to be honest. For example, whenever I go somewhere
new and connect to their network, I rename the network to someone more
friendly in my SSID list in [KDE](http://kde.org).

![SSID List in KDE](/images/ssid_wifi_nm.png)

That makes it a bit more friendly when the notification alerts whenever I
connect to a network. In the console, however, my shell is strictly Bash (for
now). All of my Bash configuration scripts and goodies can be found at my
[dotfiles repository][6], but here's a quick run down.

## Using Frameworks

Frameworks are awesome, no? Well, some are. Some we can live without. In this
case, the [bash-it][7] makes it way too easy to get an awesome Bash setup with
minimal effort. I use it to add a lot of functionality like automatic
[rbenv][8] and [nvm][9] integration as well as [git][10] extensibility and a
bit more. Whenever I open my terminal, I'm greeted with this:

![Hello, Konsole](/images/hello_konsole.png)

Using frameworks allow you to get a working system as soon as possible, but
it's recommended probably by every living developer on the platform that you
**absolutely go 'vanilla'** when you're using a framework. Tweak *the shit* out
of it. Make it your own. `bash-it` comes with a lot of plugins, completions
(try typing `git` in your console then a space then tab. that's *completion
magic!*), and aliases for Bash.

> I recommend taking a look at [Nettuts's tutorial on Bash][11] and how to
> configure it to your will.

Let's take a closer look at what's going on here.

![Closer shot of Konsole](/images/closer_shot_konsole.png)

From that extra zoomed shot of my Konsole session, you can tell the following:

  * I'm running as user "jacky" on machine "neuromancer" (my laptop). This is
    useful when I switch local users on my machine from `jacky` to 
    (`root`)[^1].

  * I'm using ruby 2.0.0 thanks to the globally set version of
    `rbenv` (as noted by ❖ 2.0.0-rc).

  * I'm in my `$HOME` directory (as noted by `~`).

  * The last process run exited successfully (as noted by ` ☷ `).

> This Bash-it theme is available in [my fork of bash-it][12], it'd require
> another tool for version control, [`vcprompt`][13] to be available in your $PATH.
Now, let's say I wanted to start hacking on [Wintermute][14]. This is what I'd
do:

Some of the actions may not be visible there, but I was able to quickly 'jump'
from `~` to the location of my copy of the sources of Wintermute (about three
folders deep) with less than 10 ten keystrokes thanks to [fasd][15]. Also,
with a bit of editing to my [~/.inputrc][16], past commands I've executed for
opening Vim were available just by pressing up; time saving.

# Pick your Rodeo

The tool I'd recommend for such an endeavor is [`homeshick`][1]. It's a
Bash implementation of the Ruby gem [homesick][2]. It does take a bit more
time to set up than its Ruby counterpart, but consider this: if you have to
install Ruby on a new system, install `homesick` and then use a local tool for
handling Ruby versions like [rbenv][3] or [rvm][4], then why bother installing
system Ruby? It looks like a chicken and egg (or rather rooster and hen)
situation. Install this tool to your local system by executing the following (or
by following the [official instructions][5]):

{% highlight bash %}
$ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick

# Add `homeshick` as an alias to the command. Don't worry, you can also edit
# this out later (you might have to).
printf '\nalias homeshick="$HOME/.homesick/repos/homeshick/home/.homeshick"' \
  >> $HOME/.bashrc
{% endhighlight %}

## Slicing Up Configuration

At this point, you can begin dicing up your configuration in your local system
into smaller parts. For example, I keep my [Vim configuration][17] separate
from my [central configuration][6] out of habit. As prescribed by the docu

[1]: https://github.com/andsens/homeshick
[2]: https://github.com/technicalpickles/homesick
[3]: https://github.com/sstephenson/rbenv
[4]: https://rvm.io/
[5]: https://github.com/andsens/homeshick#installation
[6]: https://github.com/jalcine/dotfiles/tree/master
[7]: https://github.com/revans/bash-it
[8]: https://github.com/revans/bash-it/blob/master/plugins/available/rbenv.plugin.bash
[9]: https://github.com/revans/bash-it/blob/master/plugins/available/nvm.plugin.bash
[10]: https://github.com/revans/bash-it/blob/master/aliases/available/git.aliases.bash
[11]: http://net.tutsplus.com/tutorials/tools-and-tips/the-command-line-is-your-best-friend/
[12]: https://github.com/jalcine/bash-it
[13]: https://github.com/djl/vcprompt
[14]: http://wintermute.jalcine.me
[15]: https://github.com/clvv/fasd
[16]: https://github.com/jalcine/dotfiles/blob/master/home/.inputrc
[17]: https://github.com/jalcine/vimrc
[^1]: Very bad practice. I only do this to use certain aliases and what not,
but doing this can make some files you use inaccessible by your user account.
