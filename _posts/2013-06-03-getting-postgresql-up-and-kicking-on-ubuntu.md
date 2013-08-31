---
layout: post
title: "Getting PostgreSQL up and kicking on Ubuntu"
date: 2013-06-03 13:46
comments: true
tags: how-to debian postgresql postgres installation ubuntu

---

After attending [an awesome hackathon]() last weekend, I realized quite a few 
things; the most prevelant being the necessity of having popular databases 
like PostgreSQL and MongoDB ready to go on your system.<!-- more -->
For those using Linux system, specificially of the [Debian](http://debian.org) or 
[Ubuntu](http://ubuntu.com) flavors; this quick and (should be) easy guide is 
here for you.

## Installing Software

Typically you'd need both the production software *and* the development client 
headers for the server on your system. Running the following should help:

{% highlight bash %}
$ sudo apt-get install libpq-dev postgresql-9.1
{% endhighlight %}

That'd swiftly install the packages and set up the server for automatically 
starting up on system start. To ensure that everything is fine, try checking 
the version of PostgreSQL's command line utility, `psql`.

{% highlight bash %}
$ psql --version
psql (PostgreSQL) 9.1.9
contains support for command-line editing
{% endhighlight %}

## Setting up a User

Now, the more tricker aspect of things might be setting up a new user. Coming 
from a MySQL background, the commands aren't that different (if not at all). 
The only problem after installing is that your user account on your system 
won't be recognized as a valid user account in Postgres. The following will 
help you log-in and set up an account to use with Postgres.

{% highlight bash %}
$ sudo -u postgres psql
psql (9.1.9)
Type "help" for help.
postgres=#
{% endhighlight %}

> You might get a warning about `psql` not being able to switch its working 
> directory to the directory you're working from. That's a permission issue 
> since your user account isn't in the `postgres` group.

Hit `Ctrl+D` ande nter the following commands to get Postgres to recognize you 
as a user.

{% highlight bash %}
# Tell Postgres to create a new user with our username.
sudo -u postgres createuser --superuser $USER
# Open up the PostgreSQL shell.
sudo -u postgres psql
{% endhighlight %}

Now, within the PostgreSQL shell, create a password to be used with said 
account.

{% highlight bash %}
## Replace $USER with your username.
postgres=# \password $USER
{% endhighlight %}

Typically, when an application connects to Postgres on Ubuntu, it'd try to 
find a user AND database with the username that's currently logged in. This'll 
also help with making the starting of `psql` easier too so by running the 
following you should be able to do so:

{% highlight bash %}
$ createdb $USER
{% endhighlight %}

That's all there is to it! For more information, check out the [community Wiki page on Postgres](https://help.ubuntu.com/community/PostgreSQL).

