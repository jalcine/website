---
layout: post
title: "Some Meta Work for Wintermute"
drafted: 2014-07-05 00:59:17 EDT
categories:
  - development
  - wintermute
  - research
---

Every day, I spend about twenty minutes to almost three hours pondering how I
should restructure Wintermute and get it working in a way that could be
eventually transparent and a cobblestone to other awesome projects. But most of
this forethought is done in notebooks and random scribbling; I can't get to
the actual _writing_ of the code just yet. It's odd but the fact that I feel
that my toolchain is lacking specific features necessary to build the kind of
software I'd need right now is enough to break open the editor and start
writing them myself.

## Building Up cmake.vim

The biggest issue I had was with Vim not having things about my project known
like tags, include paths and `:make` information. I initially thought about
hard-writing this into a `.vimrc.local` for the project but as I constantly
changed how the source tree was laid out; I figured that having something that
would do this for me would be better. I decided to work on and maintain a
[plugin for Vim][1] that incorporates values from CMake like the build system
and jams into Vim and other plugins for the sake of improving development. Now
with it, I can build specific targets instead of hitting `:make` each time; and
get errors into Vim a lot faster.

The plugin is still a bit early; but I took a bit of time writing out a test
suite for it and I'm also working on drafting out more documentation;
representing all of the methods and logic exposed by the plugin so we can get
it going into other plugins like probably Syntastic, vim-dispatch and even
YouCompleteMe (given it'd cooperate).

## Redrawing the System

Rebuilding Wintermute meant taking everything I've done so far, learn from it
and understand what exactly I could do now with the knowledge I've obtained and
use it to build something that would require less reworking for adapting upon
in the future. There's no real way to prevent that; but I figure that I'd work
as hard as feasibly possible to make it easy to do so. As I've mentioned
before, I spent a lot of time drawing and scribbling thoughts and plans into a
notebook; but once I had something malleable yet defined, I took to
[Umbrello][2] and drew out the initial aspect of what the class hierarchy and
structure of Wintermute's core library would look like.

![Initial diagram of Wintermute.](/images/wintermute-uml-prototype.png)

Ignoring the harsh coloring, I managed to define a few classes that would work
as some of the basis of Wintermute's core. I did my best to ensure that each
class focused on a particular purpose. For example, the `Wintermute::Message`
class is meant to handle the identification and serialization of data. It
doesn't know if it's meant to be used with the `Wintermute::Dispatcher` or
`Wintermute::Receiver` but it does know about the `Wintermute::Module::Designation` 
class which is necessary to do identification of modules without prying too
much into the modules themselves.

[1]: https://github.com/jalcine/cmake.vim
[2]: http://umbrello.kde.org
