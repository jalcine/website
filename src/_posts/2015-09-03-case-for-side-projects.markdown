---
layout: post
title: "The Case for Side Projects"
date: 2015-09-03 02:50:42 EDT
category: thoughts

---

I've worked on a [few projects][1] during my time as a developer. Admittedly,
they don't have much notary but they tend to be things that I've found important
to me. However, the projects I've worked on don't help anyone else but me
(outside of [cmake.vim][2]). They're positioned to help me learn more about
patterns in programming and experiment with new technologies. This leads me to
the point of this blog post.

## Side Projects Are Like Badges

A side project by itself shows a commitment you had for a period of time to
accomplish a particular goal. I'd say that it doesn't matter if it works or not,
but some would argue that functionality would play a role into whether or not
the side project was worth fussing with. An example of this would be my failed
and now deleted project `swig-tumblr`. It was supposed to make it easy to
convert a bunch of concatenated Swig template files so that one could generate a
Tumblr theme. Over time, I stopped working on it for a number of reasons. The
tests were unwieldy and I just became uninterested in using Swig for this.

Due to a personal need for this, however, I've decided to pick up this project.
But in doing so, I noticed how much work this'll take. And how it's all unpaid
labor[^1]. This is going to be something nice to tack onto my sash of projects
but I'm debating if the effort's worth it[^2].

## Starting Over When You Stop

There's definitely a few more reasons why I gave up on `swig-tumblr`. Most
notably is definitely that I didn't really outline in detail what I wanted to
do. I know I gave a brief above, but take a look at [what goes into making a
theme for Tumblr][3]. There's 12 different kinds of posts to consider and a lot
of conditional blocks that should only appear on a particular post. This is
something I overlooked the first time around. As opposed to just making a Tumblr
tag parser, I'd need a file generator tool and perhaps a local Web server to
render how each page is intended to look with tests to ensure the expected
content appears on the page.

**Mad**. **Work**.

A lot of work that I didn't initially anticipate when I first went out to begin
this project. I'm glad that I did stop when I did because I think I might have
run into this realization a bit too late. With this in mind, I can continue to
work on it and potentially release 1.0.0 soon. Its project page is currently
hosted on [Github Pages][4] but it'll be moving soon once I get around to
tinkering with it.

## Do Your Own Thing

If I'm saying at all, working on side projects can assist with your rationale
when approaching new projects; especially if you happen to be a person who jumps
from contracting roles to self-directed freelancing work[^3]. It's very easy to
just get stuck with a particular mindset of programming approaches which is
another reason why pairing up with a friend to work on a project helps a lot. It
doesn't have to be a huge part of it, it could be just getting feedback on a
particular class or view if it's been conventionally implemented[^4].

The one important thing I think that helps a lot with the development of said
project[^5] is the act of self-review. This is done either by checking over the
tests, confirming that the project's brief aligns with the goals you've set out
of the project and also blogging about your process of development as well.

Blogging on the process of your project's growth is probably the most important
thing I'd want you as a reader to take away from. And this transcends the class
of project you're working on -- be it a software, hardware or just a
non-tech project. Talk about your project. Make it your own experience and learn
from it.

[1]: /projects/
[2]: https://jalcine.github.io/cmake.vim
[3]: https://www.tumblr.com/docs/en/custom_themes
[4]: https://jalcine.github.io/tumblr-theme-toolkit
[^1]: The intent is to use this to make it easier to get paid work.
[^2]: It's worth it. I need work. Work gets me money. Money keeps this site up.
[^3]: THIS GUY DOES THAT!
[^4]: If you're a designer, feel free to swap out for more design-orientated lingo here.
[^5]: Coming from someone with one failed, one funky and a barely popular project, haha.
