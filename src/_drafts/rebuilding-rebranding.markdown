---
layout: post
title: Rebranding and Rebuilding
date: 2017-10-06 22:25:14 PDT
category: site-update
tags:
  - design
  - process
  - website
  - rebrand
  - branding
---

I mentioned to @kwuchu a while back about how I keep redesigning this website. 
I've held this site in this constant flow of redesigning [for about five years now][1]. 
However, I haven't spent a lot of time focusing on making this into my "portal";
a place for people to _really_ learn, work and enjoy me on the Web. As a software
developer, I felt that this was an excellent opportunity to work on. There's
places on this site like the [Projects][3] and [Gear][4] that could be redone to
leverage the full flexibility of my blog engine.

## Levelling the Ground
I used to use [Octopress][] for a period of time but made the transition to
[Jekyll][] when [I evaluated what I actually][2] from Octopress. I reassessed
what I had stored in the gems used to build the site and settled on this list:

{% highlight ruby linenos %}
# TODO: Import Gemfile here.
{% endhighlight %}

I had to drop a few plugins that led to me having to rewrite parts of the site
that relied on them. No big deal. For now, I just commented them out with `TODO`
tags; a quick search for that later helped in coming back to that later.

The next thing I did was blow away everything I had for styling and layouts.
This was a bit liberating because the slate here was so clean. It was also easy
to see what I was working since I worked closely to keep things semantic. I
started a [new theme][5] for this site; this time as a separate gem. The choice
of separating the _look_ of the site from the _data_ on it. 

### Building Alpha Shard
The theme, *[Alpha Shard][5]* pays homage to the team of ONI soliders and the
retired Spartan solider who saved humanity from attack of a bioweapon[^1]

[1]: {% post_url 2012-10-30-first-starts-a-reboot %}
[2]: {% post_url 2013-07-20-welcome-to-jekyll %}
[3]: {{ site.url }}/projects/
[4]: {{ site.url }}/gear/
[5]: {{ site.url }}/projects/alpha-shard
[^1]: I really enjoy playing Halo. Learn more about the Alpha Shard [here](https://www.halopedia.org/Alpha_Shard).
