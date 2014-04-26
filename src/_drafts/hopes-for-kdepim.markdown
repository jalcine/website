---
layout: post
title: "Hopes for KDE's PIM Suite"
date: 2014-03-20 12:39:10 EDT
categories:
  - kde
  - akonadi
  - thoughts
---

KDE has this collection of apps that are under this thing called the PIM
suite. It's a fantastic idea; one that's been now replicated into GNOME and
Unity. However, Akonadi (the system that stores said information) seems to be
missing some bells and whistles that would make it well rounded.

# Contact Aggregation

The trickest part that I can tell from the PIM suite is KAddressBook. I'm not
sure if there's plans to replace it, per sé, but for now, when I look at local
contacts, contacts from Google and from Facebook; I get this:

![Not-so pretty picture of me.](/images/snapshot85.png)

The whole QR idea is cool, but that's something that would have to be
displayed on-demand. And even then, it might be useless since BlueDevil can
have a list of mobile devices capable of receiving files and use that
information to send vCards to a phone. A bigger issue is that contacts are
heavily repeated. There's no system of meta-contacts (yet) in Akonadi and that
makes this whole contact management system very sloppy. An idea for a UI that
would hopefully cover some use cases that I drafted follows:

![Sketching of meta contacts app.](/images/contact-concept.png)

That would be the view for a single contact. A few key things are shown here.
This contact is composed of multiple sources of data that could be comprised
of Akonadi data sources. This allows for instant updating of said contact
information in one fell swoop.
