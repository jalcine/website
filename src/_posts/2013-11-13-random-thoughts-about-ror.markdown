---
layout: post
title: Random Thoughts about Ruby On Rails
date: 2013-11-13 07:31:23 EST
categories: 
  - "ruby on rails"
  - "thoughts"
---

> I don't consider myself to be an expert. I don't want to be; it's too boring
> of a title to hold anyways. Instead, I'd consider myself a tinkerer with
> experience of things near and far.

This is a hammering of a few thoughts. I've been working with Ruby for about
three years now and the Rails framework for about a full one now. I have to
admit, the speed at which web applications can be built is really intriguing
compared to statically typed languages like C++ but that's probably a unfair
comparison. Outside of Ruby, I've worked on hobby Web applications using 
[Zend][] and [Mojolicious][] with no real interest of taking it to market as a
skill. Rails was the turning point.

# Why Rails?
First and foremost, if you *really* did a bit of back end Web development, the
one thing that was always a concern was handling database migrations whenever
entity relationship diagrams changed (though I feel they shouldn't have).
Defining a SQL schema by hand and having PHP execute it before it was ran in
production (yes, bad practice, smell it) was less than routine but often
enough to be a problem.

One day, while I was in California for an event at Stanford, another engineer
suggested that we rewrite the entire platform using Rails (3.2.6, if that
matters). I was really against initially out of a lack of knowledge of using
the framework but I caved in. After a bit of shoddy pair programming, my whole
opinion about the damned thing changed.

# Today?
After using and working with a few Rails applications, I'm not so sure I'd
want to *continue* using it. For starters, I'm a bit of a fan of being able to
tweak and hammer things to a particular setup (take my laptop, for example).
Rails is configurable, but in a very weird way. Again, good software has
'sane defaults', but I wouldn't consider most of the defaults for Rails to
be[^1].

People are looking to the whole "let's make an API!" stage with event based
web stacks[^2] powered by Node/JavaScript and decoupling the .... hogwash. For
now, any serious disconnection from the current trends of application would
only occur when HTML5 is 100% out the door. And we know when that's happening.

[^1]: My options are slightly changing with these RCs of Rails 4. The fact
that more functionality is refactored out into separate gems make me a bit
more comfortable (i.e: protected_attributes, turbolinks). But they're RCs.
[^2]: Fun fact! Nearly every web application that exists is event driven!
[mojolicious]: http://mojolicio.us/
[zend]: http://framework.zend.com/
