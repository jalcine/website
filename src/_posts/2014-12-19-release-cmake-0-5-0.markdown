---
layout: "post"
title: "cmake.vim 0.5.0 Released"
excerpt: |
  Release information about cmake.vim.
date: 2014-09-19 23:28:50 PDT
category:
  - development
tags:
  - cmake
  - vim
  - release
---

I'm glad to announce that [version `0.5.0`][re] of my plug-in for Vim,
[`cmake.vim`][cmakevim] has been released! It's a heavily tested, gut-torn-out
rewrite of the plugin and is ready for the public to use. The goal of this
plug-in was for complete integration of the [CMake][] build configuration tool
within Vim and accompanying plugins like [YouCompleteMe][], [Syntastic][] and
make use of the features that other programs like [ctags][] had to offer
without too much heavy wiring into Vim. It _should_ be an plug-and-play
solution. Fortunately, if it's not, feel free to [report your issue][bugs] and
get it cracking.

I'm still working on [Syntastic support in a pull request][sypr] so anyone can
chime in and add their two cents to things. Glad that this was pushed out,
CMake and Vim needed one another. Again, yay!

[cmakevim]: https://jalcine.github.io/cmake.vim
[cmake]: http://cmake.org
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe
[Syntastic]: https://github.com/scrooloose/syntastic
[ctags]: http://ctags.sourceforge.net/
[bugs]: https://github.com/jalcine/cmake.vim/issues
[re]: https://github.com/jalcine/cmake.vim/releases/tag/v0.5.0
[sypr]: https://github.com/jalcine/cmake.vim/pull/45
