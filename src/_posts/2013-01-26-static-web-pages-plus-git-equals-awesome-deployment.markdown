---
layout: post
title: "Static Web Pages + Git = Awesome Deployment"
date: 2013-01-26 04:09 UTC-0500
category: development

---

I've been having lots of fun working with [Octopress][] and working with it
to make it as simple for me to use as possible. Fortunately, this hasn't
been much of a challenge. With a bit of trial and error, I've even managed
to abstract the act of static web page deployment without too much help! Now,
it's near possible to implement "Heroku-like" deployment. Towards the end,
I even throw in a tip on how to do something similar to how Heroku might
have deployment done as well!

# Prerequisties

By continuing from here, I'm going to assume that you either:

  * have access to a remote server that's working with a domain or,
  * got something like [Pow][] or a local web server running to pick up 
    changes from a folder of choice.

That'd allow for you to view changes real-time. Another assumption is that 
you're familiar with [Git hooks][] and [the difference between the two][]. 
If enough confusion incurs, I might make a separate post about it.

# Setting up the Remote Environment

First, make sure you got Git up and running on your system.

{% highlight bash %}
$ git --version
git version 1.7.10.4
{% endhighlight %}

Secondly, ensure that you can SSH as a user or at least provide yourself 
with access.

Next, set up the bare repositories that you'll be using to push your changes.

{% highlight bash %}
$ cd ~
$ mkdir -p ~/repos/swag
$ cd ~/repos/swag
$ git init --bare
{% endhighlight %}

We use the `--bare` option here to tell Git that we only want the 
Git-specifics (the index, configuration options, etc) on the server, 
nothing more.

Next, we go on to set up our hooks. We go back into our mighty console and 
execute the following:

{% highlight bash %}
# (from working directory ~/repos/swag)
$ cd hooks
$ vi post-receive
{% endhighlight %}

With in the `post-receive` hook, we enter the following content:

You'll want to change the values of the following:

 * `LIVE_BRANCH` to the name of the branch that'd hold the code for 
   deployment and,
 * `LIVE_PATH` to the (preferably) absolute path that of which the code 
   should be stored.

With this, you've fully set up your remote enviroment. Now, you can continue 
off back to your local development machine and continue.

# Setting up the Local Environment

On your awesome local machine, the act of instant deployment begins. Now, 
the best part about this is that you can do this with an existing Git branch 
that has static files or work on this with from scratch if you're just 
starting out.

In a new directory, clone the repository from the server, add some files, 
commit and push; the typical personal Git flow.

{% highlight bash %}
# (from an awesome folder)
$ git clone joe@acme.net:~/repos/swag swag
# You might get a warning about cloning an empty repository; it's fine.
$ git add .
# Move in the files from the old repository (if it exists)
$ mv file1 ../files
$ git add .

$ git commit -m "Swag 1 point"
$ git push
{% endhighlight %}

After you push, you might notice information about checking out done in your 
remotes. That's the `post-recieve` hook updating the code in reaction to the 
branch that you pushed.


# Quirks

I have to admit, in [the Gist shown above][], there's a few problems I'm 
going to have to adapt this post to show.

  1. __Single branch push support__ - If you pushed using 
     `git push origin --all` or whatever remote you specify, currently 
     this hook would *not* be able to notice such a push, or rather, parse 
     it properly. I'm experimenting with a clean way to do this.

  2. __Merging issues__ - If, for some reason, there was a merging problem, 
     there's no way for you to tell, from what I know.

[Octopress]: http://octopress.com
[the Gist shown above]: https://gist.github.com/4618184
[Pow]: http://pow.cx
[Git hooks]: http://git-scm.com/book/en/Customizing-Git-Git-Hooks
[the difference between the two]: http://stackoverflow.com/a/9653208/602588
