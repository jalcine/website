---
layout: post
title: Introducing CMake for Vim
date: 2013-09-26 15:39:35 EDT
category: projects
---

Earlier today, I patched up the code base for [`cmake.vim`][cmake.vim] and
pushed out [version 0.1.9][stable] to the world and on [Vim.org][vimscripts].
This plug in hits home since I use CMake a *lot* for Wintermute and KDE
project building.

## What Can It Do?

Right now, function is quite minimal. [The documentation][docs] goes over to
its minimal detail as to what it can do. For one, this helps when just trying
to get things up and running with CMake projects.

## What's Planned?

Well, next steps for this is to move the raw system call to make and call
`:make` instead so that we can get the functionality of `:cwindow` into the
mix. Also, I'm still hacking at it to pull information about flags and what
not to expose to other plug ins like Syntastic and YouCompleteMe.

Another is to expand its form and allow it to build specific targets though
this can be easily done once `makeprg` is set to the correct paths, also
providing automatic command line completion. **Wham!**

Snippets are something we could all use for CMake but I won't be adding them
to this project. Instead, I strongly recommend adding [`vim-snippets`][snippets]
to your plug ins and using what they provide.

That said, please enjoy said plug in and feel free to fork, rant, and patch to
your heart's content!

[cmake.vim]: http://jalcine.github.io/cmake.vim
[stable]: https://github.com/jalcine/cmake.vim/releases/tag/v0.1.9
[vimscripts]: http://www.vim.org/scripts/script.php?script_id=4731
[docs]: https://raw.github.com/jalcine/cmake.vim/master/doc/cmake.txt
[snippets]: https://github.com/honza/vim-snippets
