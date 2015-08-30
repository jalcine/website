---
title: "Defining All of the Things"
layout: post
category: thoughts
date: 2015-08-30 11:41:28 EST
tags:
  - home-automation
  - wintermute

---

Whilst chatting in this new [Slack][] room [@bossjones][] set up for [home automation
and robotics][], I thought about how interactions with more laymen devices could
go down from a programmatic standpoint. It's kind of amazing how similar to
having a service-orientated architecture that all of this is. Depending on how
it's designed, each service could represent one or many instances of a class of
devices, be it a light bulb, a IR transceiver or ever your phone. I think that I
might be mildly biased in this thinking since that's a lot of what I was touching
on at my last full-time role[^1]. It's exciting nonetheless to be able to think
of every day objects as a suite of objects that have properties and methods
(when reduced to the closest and crudest forms of objects). For example, this
is what I think what the definition of a sink could have:

{% highlight bash %}
object Sink : public {
  float fillPercentage();
  float waterPressure();
  float waterTemperature();
  void setWaterTemperature(float);
  void turnWaterOff();
  void turnWaterOn();
  void setWaterPressure(float);
  void drainWater();
}
{% endhighlight %}

This would be enough to freak someone out who'd be using the sink at home, is
abstract enough[^2] to work for both kitchen and bathroom sinks and could be the
basis for controlling tubs as well. Why the hell would someone want to automate
their tubs? **Only Kanye knows**. The thing about this is that most of this
information[^2] is stored in public ontologies about what objects can and can't
do and what their functions are. An [ontology][] is a computer's way of
classifying what `X` is, can be, can do, would be and so forth. Most of this is
done through heavy layers of relationships and of course it's written in the
world's most popular markup language. For example, this page refers to the
[ontology of a camera][1]. A lot of the reference points in it points back to
the W3C's implementation of either a scalar value or the structural form of God
knows what. It's still something I haven't gotten my mind around. But it's a
fascinating topic.

The end goal that I personally have is to define actions for objects, be it a
microwave, fridge or a television set and have them actionable over a particular
RPC of sorts. That sounds a bit scary since now you'd have to be concerned about
DDoS attacks from your fellow tech friends who want their $5 back or your
microwave automatically resetting itself to `00:01` despite your best efforts to
prevent it. It'd lead to forcing signed requests, if not heavily encrypted using
HTTP/2 and GPG over the wire.

[home automation and robotics]: https://homeautomationnerds.slack.com
[slack]: https://slack.com
[@bossjones]: https://twitter.com/bossjones
[shutterstock]: https://submit.shutterstock.com/
[ontology]: http://protegewiki.stanford.edu/wiki/Protege_Ontology_Library#OWL_ontologies
[1]: http://protege.cim3.net/file/pub/ontologies/camera/camera.owl
[^1]: At the time of writing, that'd be at [Shutterstock][].
[^2]: At least, I think it is. (I'll be referring here a lot).
