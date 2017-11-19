---
layout: post
title: Rebranding and Rebuilding
category: site-update
excerpt: Rebuilding my website from the ground up.
tags:
  - design
  - process
  - website
  - rebrand
  - branding
---

{:toc}

I mentioned to [Iheanyi][11] a while back about how I keep redesigning this website. 
I've held this site in this constant flow of redesigning for about five years now. 
However, I haven't spent a lot of time focusing on making this into my "portal";
a place for people to _really_ learn, work and enjoy me on the Web. As a software
developer, I felt that this was an excellent opportunity to work on. There's
places on this site like the [Projects][8] and [Gear][9] that could be redone to
leverage the full flexibility of my blog engine.

## Levelling the Ground
I used to use [Octopress][] for a period of time but made the transition to
[Jekyll][] when [I evaluated what I actually][3] from Octopress. I ended up
gutting out a lot of gems I used initially and added things that I knew I wanted
to add to the site to provide readers and myself value.

### Appearance
The next thing I did was blow away everything I had for styling and layouts.
This was a bit liberating because the slate here was so clean. It was also easy
to see what I was working since I worked closely to keep things semantic. I
started a [new theme][4] for this site; this time as a separate gem. The choice
of separating the _look_ of the site from the _data_ on it. 

### Building Alpha Shard
The theme, *[Alpha Shard][10]* pays homage to the team of ONI soldiers and the
retired Spartan solider who saved humanity from attack of a bio-weapon[^1]. Some
scary :poop:.

## Build Times
I've been using Jekyll for [some time now][1]. It's been really great since
I enjoy tooling and tweaking things to my heart's content. However, since making
the shift into (more-or-less) [full-time freelancing][2], I noticed that the
build flow for my site wasn't the easiest to work with.

As I begun looking at some pain points in the flow of tweaking my site, I took
some notes from [Michael][3]'s review of their Jekyll usage in [2016][4]
 and in [2017][4]. Seriously though, if your blog is powered by Jekyll; I'd
recommend checking out those posts - Michael goes in. The first thing I ran
after checking out those posts was the profiling command:

{% highlight bash %}
Filename                                                                       | Count |    Bytes |  Time
-------------------------------------------------------------------------------+-------+----------+------
_layouts/post.html                                                             |   124 |  810.47K | 8.301
_layouts/bare.html                                                             |   341 | 3456.65K | 6.768
_includes/head.html                                                            |   341 | 1095.50K | 3.349
_includes/footer.html                                                          |   340 |  896.15K | 1.529
sitemap.xml                                                                    |     1 |   29.11K | 1.091
_layouts/tags.html                                                             |   199 |   63.10K | 0.803
_includes/header.html                                                          |   339 |  401.57K | 0.778
_layouts/tag_feed.xml                                                          |   199 | 1946.57K | 0.721
_includes/post_footer.html                                                     |   124 |  151.58K | 0.715
(jekyll:assets)                                                                |  4142 |   98.52K | 0.484
_includes/post_header.html                                                     |   116 |   12.71K | 0.260
_posts/2013-03-02-kick-starting-bugzilla-with-plack-a-psgi-solution.markdown   |     1 |    1.98K | 0.183
_includes/post_listing.html                                                    |   200 |   43.62K | 0.181
feed.xml                                                                       |     1 |   48.31K | 0.171
_posts/2013-01-26-static-web-pages-plus-git-equals-awesome-deployment.markdown |     1 |    5.07K | 0.158
_posts/2014-08-30-using-shared_ptr-and-dlfcn.markdown                          |     1 |    2.79K | 0.126
_includes/masthead_post_header.html                                            |     8 |    2.10K | 0.045
_includes/newsletter_inline.html                                               |   340 |  323.73K | 0.042
_posts/2015-08-05-moving-to-neovim.markdown                                    |     1 |   14.44K | 0.041
weblog/index.html                                                              |     1 |   81.38K | 0.035
_posts/2013-08-25-my-local-config.markdown                                     |     1 |    5.52K | 0.033
_includes/notices.html                                                         |   340 |   80.35K | 0.031
_posts/2014-02-15-kde-and-networking.markdown                                  |     1 |    5.17K | 0.030
gear/index.html                                                                |     1 |    4.65K | 0.029
_posts/2014-05-08-unit-testing-wintermute.markdown                             |     1 |   12.40K | 0.025
_posts/2015-02-05-using-libuv-for-event-emission.markdown                      |     1 |   16.02K | 0.022
work/resume/index.html                                                         |     1 |    8.25K | 0.021
_posts/2015-09-08-testing-routes-with-hapi.markdown                            |     1 |   10.70K | 0.020
_posts/2015-09-26-im-still-tweeting.markdown                                   |     1 |    8.49K | 0.014
_posts/2014-09-10-dotfiles.markdown                                            |     1 |    4.41K | 0.014
_posts/2014-12-01-ending-2014-welcome-2015.markdown                            |     1 |    5.58K | 0.012
index.html                                                                     |     1 |    2.88K | 0.012
_posts/2017-02-12-i-failed.markdown                                            |     1 |    5.73K | 0.010
_posts/2013-03-10-mpris-and-kde.markdown                                       |     1 |    6.96K | 0.010
_posts/2015-03-29-setting-up-openvpn-on-debian.markdown                        |     1 |   11.93K | 0.009
_posts/2015-05-10-thoughts-zocp-wintermute-iot.markdown                        |     1 |    3.88K | 0.008
_posts/2015-07-24-keep-blade-sharp.markdown                                    |     1 |    5.88K | 0.007
_posts/2015-07-16-blur-between-sense-of-tech-and-people.markdown               |     1 |   10.51K | 0.006
_posts/2015-11-11-neovim-dropped-its-fire.markdown                             |     1 |   11.60K | 0.006
_posts/2014-04-19-starting-with-a-flash.markdown                               |     1 |    1.21K | 0.006
_posts/2015-09-19-things-i-read-2015-09-19.markdown                            |     1 |    4.19K | 0.006
_posts/2016-06-09-using-neovim-neomake.markdown                                |     1 |    5.99K | 0.006
press/index.html                                                               |     1 |    1.71K | 0.005
_posts/2015-03-16-using-owncloud-a-month-in-review.markdown                    |     1 |    4.92K | 0.004
subscribe/index.html                                                           |     1 |    1.80K | 0.004
contact/index.html                                                             |     1 |    2.45K | 0.004
_posts/2015-06-18-using-sed-edit-bunch-of-files.markdown                       |     1 |    3.53K | 0.003
_posts/2015-11-01-new-job-who-this.markdown                                    |     1 |    6.19K | 0.003
_posts/2013-06-03-getting-postgresql-up-and-kicking-on-ubuntu.md               |     1 |    3.63K | 0.003
_posts/2016-11-02-back-on-the-market.markdown                                  |     1 |    1.82K | 0.003

                    done in 32.493 seconds.
{% endhighlight %}

Looking at this, a lot of the crunch time went into asset generation. Fair
enough, I use quite a bit of images on the site; 142 at the time of writing.
This is off a clean build - which made sense in my head. The post about
[Bugzilla][6] makes a call out to GitHub to fetch a gist. It seems like those
kind of calls will always create some lag in the build times. I deemed it as
something to look deeper into, adding more caching on local rebuilds whenever
possible. I currently have that for [embedded tweets][7].

That said, I went to work to refactor parts of the site that were being called
a lot and move them into include templates. Things like the footer and header of
posts were #1 contenders. For now, that's what I think I can do. I'm open to
ideas on more improvements to help with build speeds.

## Adding 'Micro' Pages

Something I always had to include when doing online chats or in email were
repeated blurbs of text about myself or things I do. That led to me creating
a [FAQ][]. Now questions that I get asked a bit often like how to [schedule time
to chat][12] or even [if I do talks and where to find them][13] are all centralized.

It's a small win - but it makes my link discovery and my mental organization of
what's where a lot easier to handle.

---

As always, all of this stuff is on GitHub at
<https://github.com/jalcine/website>. You can pursue through the tree and see 
the commits that led to this point.


[1]: {% post_url 2013-07-20-welcome-to-jekyll %}
[2]: {% post_url 2017-10-22-world-of-freelance %}
[3]: https://mademistakes.com/about/
[4]: https://mademistakes.com/articles/using-jekyll-2016/
[5]: https://mademistakes.com/articles/using-jekyll-2017/
[6]: <{{ site.url }}{% post_url 2013-03-02-kick-starting-bugzilla-with-plack-a-psgi-solution %}>
[7]: <{{ site.url }}{% post_url 2015-07-16-blur-between-sense-of-tech-and-people %}>
[8]: {{ site.url }}/projects/
[9]: {{ site.url }}/gear/
[10]: {{ site.url }}/projects/alpha-shard
[11]: https://iheanyi.com/
[12]: /faq/how-to-contact/
[13]: /faq/talks/
[^1]: I really enjoy playing Halo. Learn more about the Alpha Shard [here](https://www.halopedia.org/Alpha_Shard).
[octopress]: http://octopress.org/
[faq]: /faq/
