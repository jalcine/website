---
layout: post
title: "MPRIS and KDE Playing Nice"
date: 2014-03-10 06:42:51 EDT
categories:
  - kde
  - mpris
  - code
---

I use [KDE][] and I have a collection of music playing as well as video
playing applications on my machine (sometimes running at the same time, but
not playing). For example, I might have [Amarok][] open when I'm offline to 
play my offline collection of music and listen to podcasts as well; but 
switch to [Spotify][] when I get reconnected to play the tracks I have 
in my Spotify collection[^1]. The only issue here is that my media control keys
are currently hard-wired to work with Spotify (since I spend quite a bit of
time online). That's changed and I've been spending more time offline 
in order to encourage me to go online when necessary. Thus, came the idea of
creating a sort of multiplexer for all of the `org.mpris.MediaPlayer2`
services there is.

## Existing Solutions

As far as I know, [KMix][] has early adoption support for MPRIS capabilities.
I'd figure it to be tricky since I wouldn't assume Pulse or ALSA to provide
information about the running media process. However, it seems that a bit of
information is provided by Pulse. I ran the following:

{% highlight bash %}
$ pacmd
Welcome to PulseAudio! Use "help" for usage information.
>>> list-clients
  ....
    index: 20
        driver: <protocol-native.c>
        owner module: 9
        properties:
                application.name = "libphonon"
                native-protocol.peer = "UNIX socket client"
                native-protocol.version = "28"
                media.role = "music"
                phonon.streamid = "{12299553-cacf-43a8-a9e0-c603c8e82997}"
                application.process.id = "29439"
                application.process.user = "jacky"
                application.process.host = "neuromancer"
                application.process.binary = "amarok"
                application.language = "en_US.UTF-8"
                window.x11.display = ":0"
                application.process.machine_id = "f8b2b7ce8af8a524e8eb855c0000000b"
                application.process.session_id = "c1"
                application.icon_name = "amarok"
  ....
{% endhighlight %}

It actually returns the running PID, running language(!), and user of the media 
process so that earlier thought of lack of information is thrown out of the
window. This is probably how KMix is able to show icon and name information for
streams.

## Investigation
MPRIS is heavily rooted in the use of D-Bus, so I decided to do a little search
in D-Bus services running on the session bus when I had Spotify, VLC and Amarok
running concurrently.

{% highlight bash %}
$ qdbus | grep MediaPlayer2
 org.mpris.MediaPlayer2.amarok
 org.mpris.MediaPlayer2.spotify
 org.mpris.MediaPlayer2.vlc
 org.mpris.MediaPlayer2.vlc-8056
{% endhighlight %}

So far, so good. This means I can find any process running using MPRIS using
the following C++ sample[^2]:

{% highlight c++ %}
  QDBusConnection sessionBus;
  QDBusConnectionInterface interface;
  QStringList knownServices, mprisServices;

  sessionBus    = QDBusConnection::sessionBus();
  interface     = sessionBus.interface();
  knownServices = interface->registeredServiceNames();
  mprisServices = knownServices.filter ( "MediaPlayer2" );
{% endhighlight %}

All that would be enough just to make a `QDBusMessage` method call, but we
want a bit more than that. We can assume that the MPRIS object is stashed
under `/org/mpris/MediaPlayer2`. However, there's one slight issue that I've
noticed; a lack of a signal for listening to state changes in a `MediaPlayer2`
object.

{% highlight bash %}
$ qdbus org.mpris.MediaPlayer2.vlc /org/mpris/MediaPlayer2 | grep signal
signal void org.freedesktop.DBus.Properties.PropertiesChanged(QString, QVariantMap, QStringList)
signal void org.mpris.MediaPlayer2.TrackList.TrackAdded(QVariantMap, QDBusObjectPath)
signal void org.mpris.MediaPlayer2.TrackList.TrackListReplaced(QList<QDBusObjectPath>, QDBusObjectPath)
signal void org.mpris.MediaPlayer2.TrackList.TrackMetadataChanged(QDBusObjectPath, QVariantMap)
signal void org.mpris.MediaPlayer2.TrackList.TrackRemoved(QDBusObjectPath)
{% endhighlight %}

That was going to be the easiest part; just listening to that to handle the
switching of playing processes; but hey. However, that isn't the only
solution. I could poll the status of known players by querying the
'PlaybackStatus'. The only issue now is how often should this polling occur?
Every ten seconds sounds sensible, but every fifteen is less chronic and
probably would be more appropriate.

## Code

Code? We do that still? Oh nah. At the moment, I haven't any code. But I plan
to work on this in the near future. Good chance I'll tweet when I start.

[kde]: http://kde.org
[kmix]: http://kmix.kde.org
[amarok]: http://amarok.kde.org
[spotify]: http://spotify.com
[^1]: Since the time of writing, I've changed it back to work with Amarok
(since I've picked up podcasting listening).
[^2]: Make 'interface' into a pointer; freaking Markdown highlightling in Vim.
