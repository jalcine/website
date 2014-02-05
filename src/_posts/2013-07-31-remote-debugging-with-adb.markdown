---
layout: post
title: "Remote Debugging with Android"
date: 2013-07-31 08:30:00 AM
comments: true
tags: android debugging tips
categories: android
---

If there's one thing that plagues a developer at times, it's the number of
cables we have hooked up to our machines. Laptops, phones, tablets, watches,
you name it! Even chargers for our chargers. I'm out to solve *one* of those
problems and it helps when you're doing some interactive Android development.

The Android debugging bridge tool (aka `adb`) is a super-nifty tool that
allows you to manage your devices, emulated or physical. A powerful use of it
is the ability to handle all of its communication over
[TCP](https://en.wikipedia.org/wiki/Transmission_Control_Protocol), a (mostly)
state-aware means of transporting packets of data over
[IP](http://en.wikipedia.org/wiki/Internet_Protocol). Using a device over TCP
allows you to decouple the cable from your laptop or working station and move
around with said device much more freely, making it easy to build and test
gyroscopic applications, for example.

## Getting Started

Ironically, the first thing you'd have to do is plug your device to your
station of choice. Check if it's visible to `adb` by running the following:

{% highlight bash %}
$ adb devices
List of devices attached 
<hexadecimal number of device>
{% endhighlight %}

> If you see no devices listed, please ensure that **USB Debugging** is
> enabled on your Android device.

After that, connect both devices to a **WiFi network**. Go into your Android
device and make note of the IP address it has. You can find this under
**Settings** > **Wi-Fi** > Options - Advanced at the field "IP address".

## Connecting to the Device
With that knowledge, and your Android device still plugged in, let's set the
device's debugging tool to listen over TCP on port 5555:

{% highlight bash %}
$ adb tcpip 5555
{% endhighlight %}

> I've seen that you'd need administrative privileges if you're running
> Windows, check out [this question](http://stackoverflow.com/questions/2604727/how-can-i-connect-to-android-with-adb-over-tcp)
> for more information.

From here, you can (and should unless you're charging over USB) remove your
Android device from your laptop. We'd finish up the connection by connecting
to the device over the network.

{% highlight bash %}
$ adb connect 0.0.0.0
# Replace 0.0.0.0 with the device's IP you found earlier.
{% endhighlight %}

That's all there is to it! You should now be able to find this device in
Eclipse or Android Studio for debugging now. If any more questions come up,
try asking someone in `#android-dev` on Freenode or sending an e-mail to the
mailing list over at [Google Groups](https://groups.google.com/forum/#!forum/android-developers).

**Happy hacking!**
