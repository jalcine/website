---
layout: post
title: "Making Tumblr Themes Using Swig, Grunt and Magic"
category: development
tags:
  - tumblr
  - swig
  - itches
---

You know how annoying it is to build a Tumblr theme? From the bottom up? I
figured it'd be as simple as uploading a few pages of HTML with the specific
markup that they provide and whammo, it'd work! Technically, that's all there
is to it, but the testing process is a bit of a headache, especially since I've
been spoiled with tools like Sass and Livereload. In lieu of said frustration,
I decided to do the following:

  + Add an extension to [Swig][] that allows for the generation of both output
    useful for [Tumblr][] and for rendering in a Web browser. This allows you
    to generate direct HTML that represents a working template and copy+paste
    it right to Tumblr and reap instant benefits.
  + Build a [Yeoman][] generator that allows for the use of [Swig][], [Sass][]
    and front-end development tool to make it as simple as working on my blog
    locally to build Tumblr themes. It shouldn't be that hard. **Ever**.

The extension for Swig is still a work in progress, but it's on [npm][swignpm]
and hosted on [Github][swigh]. It's relatively straight-forward how it works.
In order to both support rendering for the Web and within Tumblr's templating
engine, it needed two modes: **tumblr** and **html**. Setting it up would
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

_So far, so good!_

Now the other part that's needed is the Yeoman generator for Tumblr, of which 
I've placed [on Github][yggh] as well. Now here comes the fun part.

{% highlight bash %}
$ npm install -g yo # Install Yeoman.
$ yo generate tumblr-swig-theme # Set up the Tumblr theme environment.
{% endhighlight %}

For now, the generator will just add [Grunt][] to handle automation with the
local web server and come with a replica of the default theme that Tumblr
provides us with, [Optica][].

[Swig]: https://paularmstrong.github.io/swig
[Tumblr]: http://tumblr.com
[grunt]: http://gruntjs.com
[Yeoman]: http://yeoman.io
[Sass]: http://sass-lang.com
[swigh]: https://github.com/jalcine/swig-tumblr
[swignpm]: https://www.npmjs.com/package/swig-tumblr
[yggh]: https://github.com/jalcine/yeoman-generator-tumblr-swig-theme
[optica]: https://www.tumblr.com/theme/37310 
