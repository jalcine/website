---
layout: post
title: "Making Tumblr Themes Using Swig, Grunt and Magic"
category: development
tags:
  - tumblr
  - swig
  - itches
---

You know how annoying it is to build a Tumblr theme? From the bottom up? :rage:
I figured it'd be as simple as uploading a few pages of HTML with the specific
markup that they provide and whammo, it'd work! Technically, that's all there
is to it, but the testing process is a bit of a headache, especially since I've
been spoiled with tools like [Sass][] and [LiveReload][] :sweat:. In lieu of said
frustration, I decided to do the following:

  + Add an extension to [Swig][] that allows for the generation of both output
    useful for [Tumblr][] and for rendering in a Web browser. This allows you
    to generate direct HTML that represents a working template and copy+paste
    it right to Tumblr and reap instant benefits.
  + Build a [Yeoman][] generator that allows for the use of [Swig][], [Sass][]
    and front-end development tool to make it as simple as working on my blog
    locally to build Tumblr themes. It shouldn't be that hard. **Ever**.
    :scream:

The extension for Swig is still a work in progress, but it's on [npm][swignpm]
and hosted on [Github][swigh]. It's relatively straight-forward with how it
works. In order to both support rendering for the Web and within Tumblr's
templating engine, it needed two modes: **tumblr** and **html**. Setting it up would
require something like the following:

{% highlight javascript linenos %}
var swig = require('swig'),
    SwigTumblr = require('swig-tumblr'),
    mySwig, mySwigTumblrForHTML, compiledTemplate,
    mySwigTumblrForTumblr;

mySwig = new swig.Swig();
mySwigTumblrForHTML = new SwigTumblr({mode: 'html'});
mySwigTumblrForTumblr = new SwigTumblr({mode: 'tumblr'});

// HTML output
mySwigTumblrForHTML.addTagsForSwig(mySwig);
compiledTemplate = mySwig.render('{ % tumblr-var Title %}', { Title: 'Foobar'});
// >>> "{Title}"

// Tumblr-friendly output
mySwigTumblrForTumblr.addTagsForSwig(mySwig);
compiledTemplate = mySwig.render('{ % tumblr-var Title %}', { Title: 'Foobar'});
// >>> "Foobar"
{% endhighlight %}

_So far, so good!_ :fire: :dizzy:

# Getting `Yo` Into the Mix :sparkles:

Now the other part that's needed is the Yeoman generator for Tumblr, of which
I've placed [on Github][yggh] as well. Now here comes the fun part!
:space_invader:

{% highlight bash %}
$ npm install -g yo # Install Yeoman.
$ yo generate tumblr-swig-theme # Set up the Tumblr theme environment.
{% endhighlight %}

For now, the generator will just add [Grunt][] to handle automation with the
local web server and come with a replica of the default theme that Tumblr
provides us with, [Optica][]. From here, you can edit and tweak to your
heart's content. The only tricky thing now is how does one extract the
generated Tumblr theme? :anguished:

The generator allows you to pick a save destination for the Tumblr-friendly
version of your theme[^1]; making it easy to just do a single copy-and-paste
and call it a day. If it was possible to upload a theme via the Tumblr API,
believe me, I would have added it :rage:[^2]. For now, this is what I got and
I'll be using it soon to redo my [own Tumblr blog][tumblrblog]. If this has
quirks or some odd kinks, feel free to hit me up, preferably using an
[encrypted message][keybase]. OR open up a pull request on Github for either
the [Yeoman generator][yggh] or the [Swig extension][swigh] itself,
whichever works best.

---

[Swig]: https://paularmstrong.github.io/swig
[Tumblr]: http://tumblr.com
[grunt]: http://gruntjs.com
[Yeoman]: http://yeoman.io
[swigh]: https://github.com/jalcine/swig-tumblr
[swignpm]: https://www.npmjs.com/package/swig-tumblr
[yggh]: https://github.com/jalcine/yeoman-generator-tumblr-swig-theme
[optica]: https://www.tumblr.com/theme/37310
[sass]: http://sass-lang.com
[livereload]: http://livereload.com/
[^1]: By default, it's to the `dist` directory.
[^2]: Doesn't mean we have to rely on it! :smirk:
[tumblrblog]: http://tumblr.jalcine.me
[keybase]: https://keybase.io/jackyalcine
