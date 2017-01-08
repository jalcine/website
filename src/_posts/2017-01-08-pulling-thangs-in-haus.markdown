---
layout: post
title: Pulling My Thangs In Haus
date: 2017-01-06 19:21:27 PST
category: infrastructure
tags:
 - dokku
 - docker
 - self hosted
 - federation
excerpt: |
  I love the notion of hosting software for single tenant use. It’s the
  equivalent to reading a recipe and making the food at home versus
  visiting a chain and getting a boring, easily reproducible experience. Some
  people really enjoy chain meals but I will _body_ a home cooked meal every
  time.

---
I like the idea of [federation][]. The notion that you genuinely own (or at the
very least, have more autonomy than what more providers allow) the content you
produce, store and share with others on the Internet. In the scope of social
media, it begins to trickle down for me but when it comes to file storage or
even communications; having control of how I send my information to someone else
and being confident that it’s reliable as well as under my discretion is dope.
This led to me making use of software like [ownCloud][], [gitolite][] and the
ilk. However, I just had these set up with no real knowledge on how to keep them
backups without my interference. This led to look for something like
[sovereign][].

## Software Turned Us Into Money

There’s also the paranoia now really shitty state of software services that
don’t give a shit about their users. Facebook serves to make its products as
filled with data for its users to pay for and share around said products like
playing cards. The products are *you* and *I* and the users are politicians,
insurance companies, healthcare providers, government - you name it. [Salim has
an excellent writeup about this][1].

I’ve always saw this coming but with these changes and the new presidential
administration coming into play - I can’t avoid to play it by ear and eye
anymore.

## Software Is Meant to Be Free?
People gotta eat - don’t get me wrong. I write software for a living by day and
I would like to keep doing so. I only have issues when said software is used to
dehumanize and disable people from exercising digital liberties. I’m not casting
Facebook in the light alone but it’s definitely one of the most unabashedly
uncaring and willing to do so.

But this post isn’t about that. Again, [read Salim’s post][1].

## Using Dokku
[Dokku][] is the shit. I know, there’s things like [Flynn][] and what not, but
Dokku is really nifty in its singular goal - a plugin based platform as
a service thingy! Realistically, Dokku is a *P*latform *a*s *a* *S*ervice that
makes it easy to push and deploy applications to a single machine. It’s like
Heroku, except that you’re not paying for anything but your own server. It’s
handy for small pet projects and things you and a few people might be using.
I definitely would lean towards [Flynn][] if you don’t want to use Heroku but
still want that control (you also probably want to handle availability but
another blog post).

Blah, blah, blah.

I ended up using [Terraform][] to build me some virtual machines on
[DigitalOcean][] and tie them some domain records over from [DNSimple][]. After
that, a few roles from a hand rolled Ansible playbook handles all of the work of
setting up Dokku with the plugins I’d like to use. The list of those are the
following:

  - <https://github.com/dokku/dokku-http-auth.git>
  - <https://github.com/dokku/dokku-letsencrypt.git>
  - <https://github.com/dokku/dokku-postgres.git>
  - <https://github.com/dokku/dokku-redis.git>
  - <https://github.com/dokku/dokku-elasticsearch.git>
  - <https://github.com/dokku/dokku-memcached.git>
  - <https://github.com/ohardy/dokku-volume.git>
  - <https://github.com/cedricziel/dokku-deployment-keys.git>
  - <https://github.com/cedricziel/dokku-hostkeys-plugin.git>
  - <https://github.com/statianzo/dokku-shoreman.git>
  - <https://github.com/mlomnicki/dokku-deploy-hooks.git>
  - <https://github.com/nickstenning/dokku-webhooks.git>
  - <https://github.com/glassechidna/dokku-graduate.git>
  - <https://github.com/mikexstudios/dokku-app-configfiles.git>
  - <https://github.com/Flink/dokku-docker-auto-volumes.git>
  - <https://github.com/dokku-community/dokku-docker-direct.git>
  - <https://github.com/dokku-community/dokku-supply-config.git>

All of these are meant to make working with little play applications, my
website’s API and a bunch of other applications I play with but also make the
development flow and security tightening a bit simpler. It looks like a bit of
overkill and it kind of is. Things like [owncloud][] won’t need something like
[shoreman][] but one of my side projects might[^1].

I _can_ give you a whole little rundown on how Dokku works, is installed and the
jazz but they have better documentation worked on dozens of people about that so
[read that][2].

## Goals with Federation
The fun part is always installing and getting things working with no problems.
It’s not rare, but it’s not predictable. It happens! The next step is getting
your devices working with this stuff. This stuff being things like my smart
phone, my personal _and_ work laptop, etc. This isn’t too much of a burden - in
fact, for me at least, the only problem is securely syndicating passwords using
something like [pass][]. The “recommended” way to handle multiple devices with
one key ring is via the “hidden master, multiple subordinates” approach[^2].
That would let me use the mobile and desktop clients for [pass][] with ease
and relative security.

Then there’s file synchronization, calendar & contact management, reading
lists, RSS/ATOM handlers, personal code hosting - bleh. All of that stuff is
relatively simple to handle and manage thanks to the push-to-deploy approach of
Dokku.

## Ambitions for Federation
One thing I always did want was a single sign on approach for these services. It
might not make immediate sense - but I hate having to sign into a service. The
way services like Slack and Lyft handle sign-ins are _the_ way - using an
authorized device to produce (or receive) a code that can be confirmed as
a valid nonce for authentication? *Goals*.

Granted, the easiest way I think of doing this with the lowest code friction
would be to use [Clef][]. Just setting up accounts with all of these federated
applications and once I’m in one application, I’m in all (and I can control
which one I want to sign out from just by using the Clef mobile app). This
slightly breaks the whole federation model - having authentication and
authorization held by a remote (but trusted) third party service. What else can
be done?

> There’s a few options here, but I can’t be bothered to set up LDAP or IPA to
> handle authentication. I’ll sign in with 2FA for now. The most compelling
> option I’m seeing is really [IndieAuth][].

### Going Indie
I’m going to do it. My goal this year is to be able to “reclaim” my data -
moving all of my media and content to a single place that I hold so I can do
what I want with it and not have to hope and plead with third party providers
that something can be added. I’m going to join the [IndieWeb][] movement. I’ll
write more about it in the near future. If you’re trying to be down, peep
<https://indiewebify.me/>.

### Toying Around With Live Projects
I’ve been working on a few digital projects - not really around social good but
moreso about conversation management and handling online. I’ll be hitting y’all
up about it soon.

---

A quote from the great Baldwin, **“If you're treated a certain way you become a
certain kind of person. If certain things are described to you as being real
they're real for you whether they're real or not”**. Fitting, don’t you think?

[federation]: https://en.wikipedia.org/wiki/Federation_(information_technology)
[owncloud]: https://owncloud.org
[gitolite]: http://gitolite.com/gitolite/
[sovereign]: https://github.com/sovereign/sovereign
[dokku]: http://dokku.viewdocs.io/dokku/
[flynn]: https://flynn.io/
[terraform]: http://terraform.io/
[digitalocean]: https://m.do.co/c/0d64aebbf668
[dnsimple]: https://dnsimple.com/r/2131c39d72a26d
[shoreman]: https://github.com/chrismytton/shoreman
[pass]: http://passwordstore.org
[clef]: https://getclef.com/
[indieauth]: https://indieauth.com/
[indieweb]: https://indieweb.org/
[1]: http://www.salimvirani.com/facebook/
[2]: http://dokku.viewdocs.io/dokku~v0.7.2/getting-started/installation/
[3]: https://www.void.gr/kargig/blog/2013/12/02/creating-a-new-gpg-key-with-subkeys/
[^1]: I think it’s a little weird, but I love finding reasons to write things in Bash.
[^2]: I might make a writeup about this, but for now, check out [this post][3].
