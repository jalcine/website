---
layout: post
title: "Testing and Checking Code in Neovim === ❤️"
category: vim
tags:
  - neovim
  - thoughts
  - testing
  - opinion
date: 2016-06-09 13:37:49 EDT
excerpt: ""
---

> I wrote a bit about [moving over to neovim][1] and it got a bit of good
> reception so I'm deciding to write a bit more on neovim from now on.
> Also, I totally finished this on an airplane.

There's been quite a few interesting plugins that's popped up about neovim.
This is going to highlight the capabilities of two plugins in particular;
**[vim-test][]** and **[neomake][]**. 

## Understanding neomake

[neomake][] aims to be the Neovim-orientated equivalent of [Syntastic][].
`neomake` _is_ lacking in a few of the "checkers" that `syntastic` provides
but for my particular use-case, this isn't a problem nor would it be a
permanent one, provided that syntastic checkers and `neomake` checkers follow a
common format in definition.

> I won't go over [setting up `neomake` here][3]; this is a blog post, not a Wiki!
> I will say that the version of `neomake` I'm using here is from [commit
> efed015][4] though and that I'm using a development version of neovim (at
> version 0.1.5-dev). This should help with scoping version and compatibility with
> the things mentioned here.

Neomake, by default, does nothing. You have to explicitly set up and tell
Neomake when you want it to begin checking for information about files you'd
like to check. Setting this up can be as direct as running it right after you've
saved or read a buffer:

{% highlight vim %}
" After a buffer's been saved or read, run :Neomake.
au BufReadPost,BufWritePost * Neomake
{% endhighlight %}

The [`:Neomake` editor command][5] just runs with the provided file as its value
to pass to the underlying checkers for the buffer's filetype. 

{% highlight vim %}
:Neomake [makers]       Run a make command with the current file as input. If
                        no makers are specified, the default makers for the
                        current filetype are used. See neomake-configuration
                        for more on makers.
{% endhighlight %}

_This_ part is similar to what `syntastic` does. The difference here now is how
`neomake` takes advantage of Neovim's [job control][6]. In short, job control in
Vim is a means to handle **multitasking** work in VimScript. This allows neomake to
execute as many checkers as possible in the background and report status updates when
it's completed. This is handy for large files or even checkers that can be run
using a network.

## Understanding vim-test

[`vim-test`][vim-test] is a meta-plugin that aims to do something similar to
what `neomake` in terms of checking files but is geared to be done less
automatically. It aims to abstract the different test suites available to a
developer as well as the different execution layers one can provide to Vim. It's
a solid plugin for being able to quickly test your code. One interesting feature
of vim-test is that it can construct a matcher for the test you're currently
under _or_ a close enough matcher based on the tag of the method/function block
you're currently under. A demonstration of this (from the [README][7]):

![Image of test matching in Go and Ruby][8]

This is personally useful when I'm working on related projects that live in a
parent directory. An example structure of said directory layout would be:

{% highlight yaml %}
acme:
 - api
 - infra
 - web
 - admin
{% endhighlight %}

Being able to work from the root directory (`acme` in this case), jump to a file
and just run `:TestNearest` encourages one to constantly test. But this is only
_half_ of the benefit of `vim-test`.

### Sending It Away - Abstracted Runners for vim-test

What keeps me with `vim-test` is that the _how_ of the test running is
abstracted from the tool. The fact that I can have tests run in a separate tmux
pane, using [Neovim's `:terminal` emulation][9] or a [custom definition][10]
changes how I've seen testing with Vim. The component that handles the actual
execution of a provided test suite's command is called a
[_strategy_ in vim-test][11]. By default, vim-test falls back to the classic
`:!`/`:shell` approach. Depending on what you set `g:test#strategy` to, you can
have it run in tmux, iTerm's separate worker support or even externally.

Strategies can allow for flexible execution of tests, even sending them to a
remote machine if necessary so that your machine is alleviated of load. This
remote execution can be done using [transformations][12].

[1]: {% post_url 2015-08-05-moving-to-neovim %}
[2]: http://guardgem.org/
[3]: https://github.com/benekastah/neomake/commit/efed015f59001b2cf28e95bff24e87ff5764a62b
[4]: https://github.com/neovim/neovim/commit/f4979d368c0079288a11e8ec014cf81ad8f6bbba
[5]: https://github.com/benekastah/neomake/blob/efed015f59001b2cf28e95bff24e87ff5764a62b/doc/neomake.txt#L33-L36
[6]: https://neovim.io/doc/user/job_control.html
[7]: https://github.com/janko-m/vim-test/blob/71923c7/README.md
[8]: https://raw.githubusercontent.com/janko-m/vim-test/71923c7/screenshots/nearest.gif
[9]: google.com
[10]: google.com
[11]: https://github.com/janko-m/vim-test/blob/master/README.md#strategies
[12]: https://github.com/janko-m/vim-test/blob/master/README.md#transformations
[neomake]: https://github.com/benekastah/neomake
[syntastic]: https://github.com/scrooloose/syntastic/
[vim-test]: https://github.com/janko-m/vim-test/
