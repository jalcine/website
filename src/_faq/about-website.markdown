---
layout: faq
title: What did you use to build your website?
date: 2018-04-17 21:35:17 PDT
---

I have a [custom server setup][3] for hosting this website. Below that, I use
a few tools. Things like [DigitalOcean][] handle the virtual private server that
I use for this and my [analytics][1] system. [Jekyll][] handles the act of
converting my flat life website into the one you see here. Domain name
management is done via [DNSimple][]. I stitch everything together by using
[Terraform][] and [Ansible][]. I store the latest copies of the source
code of my site on [my personal Git server][2]. I keep a copy on [Github][4] as
well but it's usually behind.

[digitalocean]: https://m.do.co/c/0d64aebbf668
[dnsimple]: https://dnsimple.com/r/2131c39d72a26d
[jekyll]: http://jekyllrb.com/
[ansible]: https://ansible.com/
[terraform]: https://terraform.io/
[1]: {% post_url 2018-01-21-tracking-you %}
[2]: https://git.jacky.wtf/me/website/
[3]: {% post_url 2018-01-18-new-infra %}
[4]: https://github.com/jalcine/website/
