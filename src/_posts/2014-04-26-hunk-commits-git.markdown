---
layout: post
title: "Commits Hunks in Git"
date: 2014-04-26 17:11:21 EDT
tags:
  - git
  - development
  - tips
---

Reading the post on Github about the [new feature in Github for Mac][ghblgpst]
that allowed for *partial unstaged commits* made me wonder if it was a core Git
feature. I remember seeing something about it, but it wasn't a glorified
feature. A quick `git commit --help` showed me what I was looking for; the
`--interactive` switch. There isn't documentation there directly about it; one
would have to go to [`git-add(1)` in the "Interactive Mode" section][gitaddinm]
to learn more about it. It mentions using `git add` to handle interactive mode
as shown:

{% highlight bash %}
# Snatched from http://git-scm.com/book/en/Git-Tools-Interactive-Staging
$ git add -i
           staged     unstaged path
  1:    unchanged        +0/-1 TODO
  2:    unchanged        +1/-1 index.html
  3:    unchanged        +5/-1 lib/simplegit.rb

*** Commands ***
  1: status     2: update      3: revert     4: add untracked
  5: patch      6: diff        7: quit       8: help
What now>
{% endhighlight %}

It shows you a diff of the changes made to a particular file and allows you to
continue working from where you left off; definitely helped out quite a few
times. I actually have an alias in my dotfiles just for this, a là `gci`.

{% highlight bash %}
alias gci='git commit --interactive'
{% endhighlight %}

Happy Gitting!

[ghblgpst]: http://github.com/blog/1816-partial-commits-in-github-for-mac
[gitaddinm]: http://git-scm.com/book/en/Git-Tools-Interactive-Staging
