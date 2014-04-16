---
layout: post
title: "Learn and Understand Your Editors"
date: 2014-03-29 01:46:47 EDT
categories:
  - VIM
  - plugins
  - thoughts
  - development
---

At about a quarter to two AM, I thought it'd be a good time to add a bit of
magic to my Vim setup; because why not? I was thinking about it as my brother
and I were killing zombies and avoiding creepers in Minecraft on the Xbox so I
figured I'd quickly hash it out before the thought escaped me in sleep. The
idea's to use an environment variable with a colon-separated list of terms
that I would then just search through as the list of plugins are checked and
tell it to tell Vundle to load those plugins. I saw it instrumental in doing
things like loading specific plugins for languages or others that extend
functionality for Vim as a whole. However, my idea fell through when I
attempted to do light pattern-matching against an environment variable to find
out that [Vundle][] doesn't care which plug-ins you invoke; it'll attempt to
load everything in the `$HOME/.vim/bundle` directory. That sucks. But it did
get me under the hood of what my text editor and its plugin does; thus the
conception of this post.

For the majority of this post; I'll be using either Vim 7.4, Sublime Text 3 or
Android Studio on a canary beta just to show you how different text editors
(or IDEs) can share critical aspects to development.

## Snippets Are Your (New) Best Friend

Snippets are sometimes the unsung heroes when it comes to writing code. It
saves you, the developer, the hassle of constantly typing in code that you
otherwise wouldn't have to. A few examples would be the prefixing of CSS3
properties that we all come to love but few browsers are sketchy on
supporting (cough - IE7 ~ IE9 - cough) and creating a new QObject for a new
class.

In Vim, I use [Ultisnips][], a Python-based plugin that handles a suite for
snippets for most occasions. It's self-extensible and there's a [plethora of
community-contributed snippets][snippetsrepo] waiting for you to use.

TODO: Image of Ultisnips's README

In Sublime Text, snippets are a first-class citizen. It's merely the act of
entering the snippet's name and hitting `<TAB>`

TODO: Gif of expanding Lorem Ipsum.

### Adding Your Own
TODO: Mention upside to adding own snippets.
TODO: Show the process for adding in Vim using Ultisnips.
TODO: Mention the use of abbrev in Vim.
TODO: Show the process of adding snippets in Sublime Text.

## Autocompletion: Understand It, Embrace It, Enjoy It
TODO: Point to the documentation.
TODO: List the type of auto completion you can get with Vim.

## Flex Your Shell-fu with a Multiplexer
TODO: Mention the power of REPL-like control.
  TODO: Mention Grunt for JavaScript.
  TODO: Mention Guard for Ruby.

## Extra Tidbits (About Vim)

TODO: Mention the 'K' key.
TODO: Mention usage of 'compiler' and 'makeprg'.
TODO: Understand why 'relativenumber' isnt the devil.

## From Here, Where?

[Vim]: http://vim.org
[Sublime Text 3]: http://sublimetext.com
[Vundle]: https://github.com/gmarik/Vundle.vim
[Ultisnips]: https://github.com/SirVer/ultisnips
[snippetsrepo]: https://github.com/honza/vim-snippets
