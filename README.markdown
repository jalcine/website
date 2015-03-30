# jalcine.me

This repository holds the source code for the [Jekyll][1]-powered website
that's hosted as a front facing representation of Jacky Alciné's online
presence. I've been working on this version of the site since mid-2012, but
been blogging since about 2008. However, for my own sake, I won't attempt to
publish anything older than October 2012.

## Technologies

As aforementioned, [Jekyll][1] is the core blogging tool; with [Compass][2]
and [Sass][3] used for styling the site and the light JavaScript use to make
it fully `l33t`. The [Markdown][] rendered used in this site is [Kramdown][].
For deployments, I use [Mina][] to allow for versioned deployments and rollback
support (nobody's perfect). The act of automatic deployments also help with
one-commit deploy setups via [`git-hooks`][4].

## TODO

  + [ ] Incorporate testing to confirm all expectations for the site are meant.
  + [ ] Prevent drafts from being generated when making a staging build.
  + [ ] Add information about contributing to tree.

[1]: http://jekyllrb.com
[2]: http://compass-style.org
[3]: http://sass-lang.com
[4]: https://github.com/icefox/git-hooks
[markdown]: http://daringfireball.net/projects/markdown/
[kramdown]: http://kramdown.gettalong.org/syntax.html
[mina]: http://nadarei.co/mina/
