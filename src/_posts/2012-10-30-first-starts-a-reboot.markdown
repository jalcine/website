---
layout: post
title: "First Starts: A Reboot"
date: 2012-10-30 14:34 -0500
comments: true
category: personal
tags:
  - first
  - intros

---

> Well, this is nice. This is my first blog post using [OctoPress][]
> and I have to say, I really don't need any other blogging platform
> besides this one. When they say that this is the hacker's blog, they
> weren't kidding. I've literally edited and installed everything from
> the console with no real hassle.

<!-- more -->
## About Myself

I might as well begin this blog with a bit of detail about myself. I'm
__Jacky Alcine__, a software engineer and avid fact checker (when I can be)
living in New York City. I spend lots of time of social networks like
[Twitter][] but I try to spend more time on
[StackOverflow][] or [Github][].

I do a bit of open source work but not as much as I'd like. Right now, I'm
working with a tech startup here in New York, so time's tied up even more
preventing me from giving 100% to open source. That, however, still doesn't
stop me from contributing to the community.

### Language Background ###

I didn't know if this was necessary to mention, but I'm including it anyways.
I'm a big fan of C++, it being the first programming language I wrote serious
code with and it taking me to whole new playing fields. This language taught
me the ins and outs of object orientated programming and it made working with
the language a tad bit easier. From there, I dabbled a bit with C, since
everything manages to be related to that language one way or another. I guess
you can call C the binding language or the kernel language. After this, I
picked up a bit of C# and Java from experimentation and studying online PDFs
about the language. I learned Perl from a book borrowed at the library and
picked up Python as a beginner's language into [Ubuntu][]. Now, I got about
6 languages under my belt and I'm eager to learn more.

### Bugzilla: Nice but not Complete ###
I'm quite a fan of [Bugzilla](http://www.bugzilla.org). It has an incredible
amount of potential and the next few projects I have in mind should definitely
bring the attention required to light. The first thing about it that kills me
is its lack of real customizability. Like okay, it has a templating system
for implementing new themes, but there's no real definite guide on how to do
this. I'm planning on doing this and producing an extension that allows for
the maintenance of themes in the platform. Shoot, if anything, you should be
able to have separate themes for administrative and casual user experiences.

Another thing is its lack of support for OpenID authentication or even OAuth.
Now, I have to understand and feel a bit of pain for these two. Building
applications of any kind with an external dependency for authentication is a
pain. I know this and thank God for the magic gems in Ruby that made my life
easier. Perl doesn't have such a lucky layout and this should be fixed in the
near future. This is probably due to the lack of a nice framework being used
commonly in Perl. [Mojolicious](http://mojolicio.us/) is getting close,
though.

As a bug tracker, Bugzilla __really__ follows the Unix principle well. But
nowadays, awesome software tends to be extensible. That's why this section of
the post came to be. I wonder how working with testing servers like
Hudson/Jenkins and Travis CI could help with Bugzilla's functionality.
Specific tests could be referencing to a bug and provide contextual
information for that bug. That would help me out a lot if I knew that a
specific bug was being tested on constantly, a bit reassuring actually.

So, as a recap, Bugzilla should have the following (as separate extensions):

  * OpenID support.
  * OAuth support.
  * A brand new commenting platform (for God's sake!)
  * Markdown support in comments.
  * Theme management support.
  * More AJAX functionality.

If you have any ideas what should be added here, please feel free to shoot
me an idea of them. I'm planning to set up a simple installation of Bugzilla
on my server just so users can see my ideal setup of Bugzilla one day.
Might give those developers over there a jump-start in the right direction
:grin:.

## Closing Words

I'll definitely will be doing my best to communicate over the blog as
often as I can, since it's so easy to do so. Thanks for reading, hope to
procure more content for you in the near future.

[octopress]: http://octopress.org
[twitter]: https://twitter.com/jackyalcine
[stackoverflow]: https://stackoverflow.com/users/602588/jalcine
[github]: https://www.github.com/jalcine
[ubuntu]: https://ubuntu.com/desktop
