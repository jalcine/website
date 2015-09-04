# [jalcine-website](http://jacky.wtf)

Last release date was **2015-09-04 10:23:00 EDT**.

This repository holds the sources for my website. The FQDN for my site is
currently <https://jacky.wtf> but it's been either <http://jalcine.github.io>
or <http://jalcine.me> before so confusion may ensue. Redirects, for example,
don't exist for older blog posts largely because of it being a maintenance
issue.

## Technologies

This site is rendered currently using [Jekyll][] via the [Kramdown][] processor.
CSS compilation is done using [Compass][] and [Sass][] whereas the JavaScript
used (very little) is vanilla. Deployment is done using [Mina][] to allow for
versioned deploys and easy rolling back of said deployment using nothing but
plain ol' SSH.

I've added a few things to this site including:

  + [`jekyll-compress-html`](https://github.com/penibelst/jekyll-compress-html)

## Things To Do

The following are things I need to work on for the site.

  + [ ] Incorporate testing to confirm all expectations for the site are meant.
  + [ ] Prevent drafts from being generated when making a staging build.
  + [ ] Add information about contributing to tree.
  + [ ] Set up Git hooks using [`git-hooks`][1].

[1]: https://github.com/icefox/git-hooks
[compass]: http://compass-style.org
[jekyll]: http://jekyllrb.com
[kramdown]: http://kramdown.gettalong.org/syntax.html
[markdown]: http://daringfireball.net/projects/markdown/
[mina]: http://nadarei.co/mina/
[sass]: http://sass-lang.com
