---
layout: post
title: "Setting Up OpenVPN on Debian Wheezy"
date: 2015-03-29 21:32:41 EDT
category: security
tags:
  - openvpn
  - vpn
  - debian
  - tutorial
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

## Installing OpenVPN {#installing-openvpn}

A bit of background here, I initially assumed the version of OpenVPN installed
on Debian Wheezy to be really freaking old. It wasn't _incredibly_ old, but the
packages I needed to make this easy for use weren't available via OpenVPN's
sources so I stuck with the version in Debian for now[^3]. Getting those
packages installed are as simple as running the following:

{% highlight bash %}
$ sudo apt-get install openvpn
$ sudo apt-get install openvpn-blacklist
{% endhighlight %}

The second package `openvpn-blacklist` gives you `openvpn-vulnkey` to check for
bad 2048-bit keys when used pre-shared keys. Useful if you're using that
approach but we won't do that here.

## Configuring OpenVPN {#configuring-openvpn}

From here, we'd copy over the directory that Debian's version of OpenVPN
provides for quick-and-easy setting up of SSL certificates and keys.

{% highlight bash %}
$ sudo cp /usr/share/doc/openvpn/examples/easy-rsa/2.0 /etc/openvpn/rsa -Rv
{% endhighlight %}

After that, you're going to want to update the variables files that'd be used
for the generation of the certificates and the likes. That file would be located
at `/etc/openvpn/rsa/vars`.[^4]

{% highlight bash linenos %}
export EASY_RSA=/etc/openvpn/easyrsa

export CA_EXPIRE=100
export KEY_CONFIG=`$EASY_RSA/whichopensslcnf $EASY_RSA`
export KEY_COUNTRY="US"
export KEY_PROVINCE="NY"
export KEY_CITY="NewYork"
export KEY_ORG="stark.industries" # This can be anything.
export KEY_EMAIL="vpn@stark.com"
export KEY_EMAIL=vpn@stark.com
export KEY_NAME=vpn.stark
export KEY_OU=vpn.stark
export KEY_SIZE=2048
export KEY_EXPIRE=100
export KEY_DIR="$EASY_RSA/keys"

# Issue rm -rf warning
echo "NOTE: If you run ./clean-all, I will be doing a rm -rf on $KEY_DIR"

export PKCS11_MODULE_PATH="dummy"
export PKCS11_PIN="dummy"

export PKCS11_MODULE_PATH=/etc/openvpn/pkcs11
export PKCS11_PIN=3919

export OPENSSL="openssl"
export PKCS11TOOL="pkcs11-tool"
export GREP="grep"
{% endhighlight %}

With the variables down, you can go ahead and set up the configuration of your
VPN server now. Here's a sample configuration. Encryption and the likes are
disabled so that you can slowly upgrade the ciphers and authentication for other
devices you might want to support.

{% highlight bash linenos %}
port 1194
proto udp
dev tun
server 10.8.0.1 255.255.255.0
tls-server
ca /etc/openvpn/easyrsa/keys/ca.crt
cert /etc/openvpn/easyrsa/keys/server.crt
key /etc/openvpn/easyrsa/keys/server.key
dh /etc/openvpn/easyrsa/keys/dh2048.pem
log-append /var/log/openvpn.log
status /var/log/openvpn-status.log
ifconfig-pool-persist ipp.txt
verb 3
mute 10
user nobody
persist-key
persist-tun
comp-lzo
keepalive 10 120
cipher none
auth none
push "dhcp-option DNS 10.8.0.1"
push "redirect-gateway def1 bypass-dhcp local"
{% endhighlight %}

The setup of the configuration above is really compressed, I apologize. But I
didn't want to litter it with potentially wrong documentation. I haven't found a
hub of information about the configuration options available in OpenVPN either
so that made things a bit more difficult. I'll update this post with information
when I can.

## Building Certificates {#build-certificates}

Now here comes the relatively fun part. Only because it's mostly automated. The
`easy-rsa` folder has a few scripts to handle the generation of the SSL
certificates and keys. The following commands help you walk through that
process. First things first, prime the environment to work with the scripts
provided.

{% highlight bash %}
$ cd /etc/openvpn/rsa
$ source vars
{% endhighlight %}

Then sterilize the environment.
{% highlight bash %}
$ ./clean-all
{% endhighlight %}

Now build the server-side SSL requirements (your CA and VPN key).

{% highlight bash %}
$ ./build-dh
$ ./build-ca --batch
$ ./build-key-server --batch server
{% endhighlight %}

And now you'd generate keys for the devices you'd want to connect to VPN.

{% highlight bash %}
$ ./build-key --batch client_laptop_personal
$ ./build-key --batch client_laptop_work
$ ./build-key --batch client_phone
$ ./build-key --batch client_tablet
{% endhighlight %}

> Keep in mind, the only files you'd want are the `server.ca` and the keys and
> certificates from `keys/client_*` for sharing amongst your devices. Do *not*
> share anything else. If you're familiar with PGP, I recommend generating a
> temporary key for the server to encrypt and then share said keys over a
> trusted medium like SSH. If someone got a handle of these keys, then they
> could masquerade as one of the provided devices on your private network;
> a big no-no.

## Spinning Things Up

You got your configuration in place, your keys and certificates on the
appropriate devices and now the only thing left is to _start_ the server. Long
live `sysvinit`!

{% highlight bash %}
$ sudo service openvpn restart
{% endhighlight %}

On the server side, that's all that's needed for OpenVPN. You'd want to open up
port *1194* over UDP (or TCP, if you changed it to that) for connectivity
purposes if you're using a firewall on your server. You'd also want to allow for
NAT forwarding, in the event you got this hooked up to your router which is in
turn hooked up to your console (XBox, Ouya, Playstation, etc).

{% highlight bash %}
$ export VPN_SUBNET="10.8.0.1" # Change this to the subnet you've specified.
$ export IF_DEVICE="eth0"      # Change this to the device that gets you the Internetz.
$ iptables -t nat -A POSTROUTING -s $VPN_SUBNET/24 -o $IF_DEVICE -j MASQUERADE
$ unset VPN_SUBNET
{% endhighlight %}

## Next Steps

From here, you can do a few things:

  1. Experiment with different ciphers and authorizations!
     Try out `AES-256-CBC`, the one commonly used for higher grade encryption.
  2. Enable **client-to-client** in your server so you can chat with other devices
     on the network. Useful for making private Web services avaiable on only VPN
     users.
[openvpn]: http://openvpn.net/
[oa]: http://git.jacky.wtf/oa
[1]: https://wiki.debian.org/OpenVPN#Static-Key_VPN
[2]: https://wiki.debian.org/OpenVPN#Installation
[3]: https://www.openvpn.net/index.php/open-source/documentation/howto.html
[^1]: I think this was extended to Linode as well.
[^2]: Next time I get this cynical, punch me in the jaw and tell Batman to run me over.
[^3]: I'm working on making the newer versions a bit more fun to use for Debian.
[^4]: Stark Industries is just the more popular subsidiary of Tony's :grin:.
[^5]: This is light work compared to building a replacement for GnuPG!
