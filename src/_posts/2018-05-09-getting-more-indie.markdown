---
layout: post
title: Getting More Indie
date: 2018-05-09 07:30:10 PDT
excerpt: |
  Some small updates to my site.
category: updates
tags:
  - indieweb
  - tips
---

A new addition I've added to the site was the ability to send [WebMentions][1]
directly from pages you've made responses to. This is a practice I've seen a lot
on other IndieWeb sites and I figure it'd make sense for me to fold it in. It
essentially serves as a 'evolved' comment region (but with so much more semantic
usefulness). The guts of WebMention support for my Jekyll site is powered by
[Aaron's project][2]{: .u-like-of}, something I strongly suggest useful if you're running
Jekyll and aiming to pull in WebMentions into your site.

## Leveraging Attributes in Markdown
One thing I just realized is that we can attach custom classes to links in
Markdown. This means that I can write something like:

{% highlight markdown %}
[Cookies are nice.](https://magic.com){: .u-like-of}
{% endhighlight %}

This would allow me to like that post from my post without having to do too much
setup! It's amazing. I haven't tried this out with other forms just yet but this
definitely will help me adapt my blog posts to send out more mentions. This is
in part to Jekyll's Markdown renderer, [Kramdown][3] for supporting this.

## Adding Syndication Links
[Will Norris][4] has a plugin for Jekyll that helps one handle syndication of
their content. This is essentially linking out to social posts you've made about
a particular post so it can serve as an "authoritative" reference. Frankly, this
kind of made me miss the dynamic nature of sites - being able to just send and
have it auto-publish but for now, I haven't need much of that. The code for it
is available on [GitHub][5].

---
That's what I've got so far. Let me know below if you've done something recently
with IndieWeb technologies or if you have any questions - I'll see your thoughts
below.

[1]: https://indieweb.org/webmention.io
[2]: https://www.aaron-gustafson.com/notebook/enabling-webmentions-in-jekyll/
[3]: https://kramdown.gettalong.org/options.html
[4]: https://willnorris.com/
[5]: https://github.com/willnorris/willnorris.com/blob/master/src/_plugins/syndication.rb
