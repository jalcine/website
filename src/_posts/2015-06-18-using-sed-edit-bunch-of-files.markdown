---
layout: post
title: Using Sed to Edit A Bunch of Files At Once
excerpt: |
  Real talk, I wrote this so I could remember _how_ to do this.
date: 2015-06-18 15:53:00 EDT
category: tips
tags:
  - sed
  - utility
  - linux
---

> I use `sed` and `find` so often, I figured it was a good idea to write this
> into a post about how I use them.

The `sed` command is one of the undervalued tools I have on my machine. I have
to be honest, I really only use it for its ability to edit files in place but
that alone proved it to be invaluable of a tool. For example, let's say I'm in a
project that uses RSpec and I want to update a namespace that's used throughout
the project. I'd use `find` to do a search for all of the files containing that
text:

{% highlight bash %}
find ./spec -type f -name "*.rb" -exec grep -H "Site::Models" {} \;
{% endhighlight %}

That'd dump the relative path of the file with the text "Site::Models" as well
as the partial context that the text was used. Very nifty! From here, I can
consider running the in-place replacement using `sed` and `find` again.

{% highlight bash %}
find ./spec -type f -name "*.rb" -exec sed -i.bak -e 's/Site::Models/Site::NewM/' {} \;
{% endhighlight %}

This'll replace the text _and_ generate a backup of said modified files in the
process. Always make backups!

## Keeping it DRY

Now, in the practice of keeping things [DRY][], one can add the following Bash
function to their `~/.bash_profile` to make it easy to do a search and replace
from the shell.

{% highlight bash %}
# Usage: `find_and_sed $PATH $REGEX [$FILE_REGEX]`
find_and_sed() {
  find $1 -type f -name ${3:"*"} -exec sed -i.bak -e '$2' {} \;
}
{% endhighlight %}

Using it would look a bit like:

{% highlight bash %}
find_and_sed . "s/Site::Models/Site::NewM/" "*.rb" # Only on Ruby files
find_and_sed . "s/Site::Models/Site::NewM/" # On all of the files.
{% endhighlight %}

Bash aliases something like this wouldn't work within an editor like Vim, so
dropping to the shell using `:shell`, running said command and then hitting `^D`
to get back to Vim would be an option (that's how I do it right now).

{% highlight bash %}
# From within Vim
:sh
# Under bash
find_and_sed . "s/Fruits/Cookies/" "*.txt"
exit
# Back in Vim
e! # To reload changes
{% endhighlight %}

[dry]: https://en.wikipedia.org/wiki/Don't_repeat_yourself
