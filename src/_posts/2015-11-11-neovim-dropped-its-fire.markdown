---
layout: post
title: Neovim 0.1.0 Dropped - And It’s Fire
date: 2015-11-11 16:11:29 EST
category: software
image: none
tags:
  - vim
  - neovim
  - omg
excerpt: |
  You know me. I really dig Vim and since then, I’ve moved to Neovim. But son,
  check out the features and things going down with Neovim 0.1.0.

---

So [it happened][1]. Neovim 0.1.0 is out. It’s the first minor version of
Neovim since it began a while back as [a fork of the fork of Vi][2]. To be
honest, I played with the idea of it when I first saw the alert in March 2015.
I’ve used it passively for quite some time and didn’t really realize how awesome
the shift was until [someone mentioned it to me][3][^1]. There’s a few things
about neovim that I like a lot and some things I wish I saw sooner.

## The Configuration MOVED

Since I work against a development version of neovim on my personal machine, I
routinely let it be automatically updated as part of my system’s routine
updates. I wasn’t paying attention to which packages were being updated[^2] and
of course, didn’t have [`apt-listchanges`][4] installed. After tugging on my
hair for a few minutes and grumbling, I entered `:h vim-differences` into Vim
and saw this under the tag`nvim-configuration`:

{% highlight vim %}
- Use `$XDG_CONFIG_HOME/nvim/init.vim` instead of `.vimrc` for storing
  configuration.
- Use `$XDG_CONFIG_HOME/nvim` instead of `.vim` to store configuration files.
- Use `$XDG_DATA_HOME/shada/main.shada` instead of `.viminfo` for persistent
  session information.
{% endhighlight %}

This change was a _big_ yet simple one. Yeah, sure, it’s just moving files but options
in my Vim setup make the hard assumption that everything lives under `$HOME/.vim`.
Running `:h nvim-from-vim` opened up with this:

{% highlight vim %}
Neovim is emphatically a fork of Vim, so compatibility to Vim should be pretty
good.

To start the transition, link your previous configuration so Neovim can use
it:
>
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
<
{% endhighlight %}

See, me, I didn’t want to bother with linking stuff over. I ended up just [moving
my configuration files over][5]. Crisis averted.

### Bunch of Options Dropped

This is one thing that got me really glad about Neovim. A lot of the default
options that people had to change in vanilla Vim now are being set as the
defacto setting (if not dropped altogether). The whole set of options won’t be
[completed until the 0.2 drop][6]. It’s also a really fantastic use of a
meta-issue for a feature checklist in Github. Kudos there to the Neovim team.
Things like [`history`][7], [`mouse`][8] and [`autoindent`][9] are all being
set to more sensible defaults. This means less overriding in your root
configuration file and more predictability when sharing someone else’s Vim
setup. This means pair programming could be less “how do I do this?” and more
“this code looks great!”

### Job Control

Now this is probably something that won’t get much acclaim and but the concept
of job control is :fire:. I mentioned it implicitly earlier but here’s a case
example why it’d be handy. With my [Vim plugin for CMake][10], a lot of text
processing has to be done. Also the work of having a cache to persist
information is needed to make sure information that’s dependent on other files
and their content is updated when it happens. This helps with updating tag
files, auto completion, path expansion and other features that could handle
development. This function [`cmake#targets#cache`][10] handles all of that
initial state building:

{% highlight vim linenos %}
func! cmake#targets#cache()
  for aTarget in cmake#targets#list()
    let files = cmake#targets#files(aTarget)

    if empty(files)
      continue
    endif

    for aFile in files
      let shorter_name = fnamemodify(aFile, ':r')
      let shortest_name = fnamemodify(aFile, ':t:r')
      let g:cmake_cache.files[aFile] = aTarget

      if !empty(shorter_name) && !has_key(g:cmake_cache.files,shorter_name)
        let g:cmake_cache.files[shorter_name] = aTarget
      endif

      if !empty(shortest_name) && !has_key(g:cmake_cache.files,shortest_name)
        let g:cmake_cache.files[shortest_name] = aTarget
      endif
    endfor
  endfor
endfunc
{% endhighlight %}

Loop in loop in loop[^3] :anguished:. But this gives a wealth of information to
your client about the flags that each source file would need, what kind of
options CMake is using, etc. Each of these functions do heavy recursive work and
can _seriously_ slow down Vim if you have more than 10 source files[^4]. If you
want, you can help me out; I’d appreciate it.

## The New Suite of Plugins

I use a _lot_ of plugins. So I think I have a decent-ish idea of what works for
me and plays nice with others. This list is not going to be comprehensive; it’ll
just talk about plugins I use a lot that are taking advantage of Neovim’s
features.

### [unite][12]
Unite is an abstract text discovery tool for Vim. I say _text_ and not _file_
because it, at its core, provides an interface to look for text that satisfy a
particular criteria. Now, this plugin isn’t new, but it does make use of neovim’s
async task dispatching (via job control) to do file discovery over huge directories
(via [`file_rec/neovim`][15]).

### [neomake][13]
[Neomake][13] works in a similar fashion to [Syntastic][14]. Syntastic takes a
currently provided file and runs it against a linting process. When said process
is completed, it then populates the `quickfix` or `locationlist` windows in Vim
for your review. The thing about this is that typically happened in the
foreground and prohibited the user from working with Vim while your checkers did more
semantic reference loading.

Neomake does nearly the same thing except that it does all of this in the
background (again, thanks to job control). This allows you to continue working
on the code, or even jump to another buffer, without having Vim be completely
frozen while it crunch numbers. This is extremely helpful if you want very
precise correction whilst leveraging tools that could get slow over time
(like `sasslint` or `gcc`).

### Bonus: [VimStudio][16]
[VimStudio][16] is a plugin meant to be used with Neovim so that you can work on
Android projects. It’s built with support for neovim but based on code from
[vim-android][17] and [vim-grand][18]. To be honest, I don’t work much on
Android projects (or at least, yet) so I haven’t had a chance to work with this
plugin. But from glancing at the source, it makes use of the remote plugin
architecture of Neovim, which potentially means no blocking calls when working
with this plugin.

---

Neovim is a very interesting project, but as far as I know, it has no officially
supported GUI clients. There’s [neovim-qt5][19] but I haven’t built that locally
on my machine so I can’t recommend it. What I could recommend though is for
_you_ to try out these plugins and the Qt GUI client, see what you think about
them and if there’s any quirks you think that’s related to the crafting of the
plugin, report an issue on Github. If you’re stuck on _how_ to use the plugin or
if it doesn’t work the way you expect, go to StackOverflow. Trust me, loads of
maintainers will thank you for not flooding their inbox for things that are in
the documentation (if they provide that).

[1]: https://github.com/neovim/neovim/releases/tag/v0.1.0
[2]: https://github.com/neovim/neovim/wiki/Introduction#motivation
[3]: https://github.com/neovim/neovim/issues/2888
[4]: https://packages.debian.org/squeeze/apt-listchanges
[5]: https://github.com/jalcine/vimrc/commit/15f76c783525a2dbf783beb98f7c400e008bb880
[6]: https://github.com/neovim/neovim/issues/2676
[7]: https://neovim.io/doc/user/options.html#%27history%27
[8]: https://neovim.io/doc/user/options.html#%27mouse%27
[9]: https://neovim.io/doc/user/options.html#%27autoindent%27
[10]: https://github.com/jalcine/cmake.vim/blob/b041397ff94c4e7d4fbe06f48fc64764eccb0a04/autoload/cmake/targets.vim#L191-L213
[11]: https://gist.github.com/languitar/7543cd8457449b3366af#file-gistfile1-txt-L83-L99
[12]: https://github.com/Shougo/unite.vim
[13]: https://github.com/benekastah/neomake
[14]: https://github.com/scrooloose/syntastic
[15]: https://github.com/Shougo/unite.vim/blob/a25a0324d9664da1ae392c861539fd389e2c1a9b/doc/unite.txt#L2100
[16]: https://github.com/DonnieWest/VimStudio
[17]: https://github.com/hsanson/vim-android
[18]: https://github.com/meonlol/vim-grand
[19]: https://github.com/equalsraf/neovim-qt
[^1]: I have to admit, I haven’t the time to look at that issue (I don’t use CMake much anymore).
[^2]: Feel like this breaks the rules of some sysadmin guide out there.
[^3]: That’s all programming’s about: looping.
[^4]: Reminder me to add load testing to cmake.vim.
