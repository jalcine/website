---
layout: post
title: "Moving Around Vim"
date: 2014-04-24 23:27:07 EDT
excerpt: |
  A little anchor into how I can move around in Vim.
category: vim
tags:
  - vim
  - self-reference
---

I've only learned a few of Vim's motion keys, those being the following:

  1. `[COUNT]h`, `[COUNT]j`, `[COUNT]k` and `[COUNT]l`: Move [COUNT] lines left,
    down, up, right respectively.

  1. `gg` & `G`: Jumps to the very first or very last line respectively.

  1. `$` & `^`: Jumps to the start or end of the non-space character
    *respectively.

  1. `C-g`: Shows you the current location of the cursor.

That's about it. I end up having to count (or even worse, running 'set
relativenumber number') to determine how far I'll need to jump. Tis maddening,
I say! I decided to just `:h motion.txt` and learn me some Vim motions. The
beautiful thing about Vim that makes me stick with it is mainly its verbal
functionality. I'll explain that below, but basically, if you wanna jump down
10 lines, just `10j` in normal mode. Wanna go up four lines but three words to
the right? That's `4k` then `3w` to stop at the first character of the word
you jump to or `3W` if you want to be at the end of the word.

Realistically, the best way to learn is to use them constantly. So what I
ended up doing is scribbling some of these motions to a sticky note and tagged
them onto my work monitor and a digital one on my personal KDE desktop. Things
like filtering `!`, case swapping `g~`, and indenting `=` are all on there. If
there's one thing that's proven, it's that Vim's core documentation and help
files are top quality. Well, at least *I think* they are. Happy Vimming!
