---
layout: post
title: "Setting Up OpenVPN on Debian Wheezy"
---

Setting up a VPN server is one hell of a job. I really thought it'd be easy to
just set up and go. Setting up a static key VPN using **[OpenVPN][]** [is really
straightforward][1] but we don't use static keys out here. It's a good start
though, in terms of familiarizing yourself with how OpenVPN works and all but
holy balls, lol. I remember seeing a tool that created a VPN automatically for
you using your own DigitalOcean[^1] account to handle making the VPS. For
$5/month, your own controlled VPN sounds really good. But as always, I was
curious how I could incorporate this VPN building into [oa][]. OpenVPN can use
TLS for its encryption since I figured since I managed to get the blog using
TLS, why not have the VPN do the same?[^2].

Before we continue, I should remind you that this is a reflection post of me
setting up OpenVPN on Debian. If you're looking to do so yourself, check out
[Debian's][2] and [OpenVPN's][3] official documentation before continuing here.

## Installing OpenVPN

  1. TODO: Explain how you'd install OpenVPN's APT source list for Debian.
  2. TODO: Explain why you'd do #1.


[openvpn]: http://openvpn.net/
[oa]: http://git.jacky.wtf/oa
[1]: https://wiki.debian.org/OpenVPN#Static-Key_VPN
[2]: https://wiki.debian.org/OpenVPN#Installation
[3]: https://www.openvpn.net/index.php/open-source/documentation/howto.html
[^1]: I think this was extended to Linode as well.
[^2]: Next time I get this cynical, punch me in the jaw and tell Batman to run me over.
