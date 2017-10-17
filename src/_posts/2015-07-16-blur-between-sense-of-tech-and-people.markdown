---
layout: post
title: The Blur Between The Sense of Technology and People
byline: My response to the Google Photos incident and then some.
excerpt: |
  After the incident, I had some words to share.
date: 2015-07-16 21:12:16 EDT
revised: 2015-07-18 22:54:20 EDT
category: response
image: none
tags:
  - google
  - ai
  - twitter
---

Some of us out there, myself included, believe that one day, we'll live in a
world where computers will have a hand in every aspect of life; from driving to
creating food and probably making our beds for us. But for now, we'll have to deal
and work on the problems that technology and our internal biases produce:

{% twitter https://twitter.com/jackyalcine/status/615329515909156865 %}

The speed at which this was screenshotted and tweeted represents the anger
I felt at the moment. A company with offices in probably every part of the
planet, holding nearly 95% of my e-mail traffic and maintainer of my phone and
tablet's operating system and hardware couldn't be bothered to ensure that their
software couldn't reach a broad audience of people who tend to be heavy technology
consumers? :triumph:

---

Frustration aside, if we took away the people aspect involved in this
complication and focused *solely* on software; one can say that this was just
a misclassification due to pictures being provided that fell outside of the
domain of the facial recognition algorithm's provided models. That statement in
itself leads to the bigger problem; which involves more of the wet-ware that was
involved in building said models and tweaking said algorithms. I'm not going to
repeat what [many][5] [news][6] [outlets][7] [have][8] [reported][9] on this
situation at this point[^1]; Twitter can help you follow the sequence of events.
What will be addressed here are the issues that led to this problem and maybe
the providing of solutions for free.

## Having a Diverse & Inclusive Quality Assurance Team
Having a strong QA (quality assurance) team allows developers and product
managers work with comfort knowing that products are working to the expectations
that they both can agree on. There's no question that Google has the such[^2].
[Scott][sh] presented this point on Twitter:

{% twitter https://twitter.com/shanselman/status/616478860981334016 %}

My thoughts align with this. Like :100:. With Google being a global company, you'd
assume that [racial and gender diversity][13] wouldn't be that difficult of a
problem for them to solve. That's an Utopian way of looking at things though
given the state of the world of tech when it began and how it's behaved.
Saying it bluntly, it just doesn't make sense barring the obvious why the
world's most popular search engine was incapable of recognizing the face of
a dark skinned Black person.

In a reply to Scott's tweet, [Erica][eb] mentions her experience as a beta user
for Google Photos:

{% twitter https://twitter.com/EricaJoy/status/616649164978388992 %}

Of course, a few questions began to come to mind. For starters, what kind of photos
were used in the acceptance cycle (or during Erica's testing experience) that
wouldn't have allowed what I've experienced from happening to them? Were lower
quality images (like in the range of two mega pixels) used? Did the tests include
personal content or were they purely stock level imagery?

{% img "{{ 'obama-wtf.gif' | image_path }}" width:"auto" height:"auto" alt:"Obama's questioning this as well."%}

## Higher Quality === Better Matching?
For those curious, here's the details on one of the pictures from that collection:

{% img "{{ 'snapshot249.png' | image_path }}" width:"auto" height:"auto" alt:"Details on image with matching issues." %}

All of the shots were taken on a [Nexus 4][10] using the front-facing camera.
The phone is still in my possession after these few years. Tech pundits are
free to use this as an excuse as to why the recognition was poor but it's
easily contested. Again, one question remains: did the team have a large
enough collection of darker toned people to help circumvent, if not avoid this
problem or have a quantity equivalent in size, to photos of other people they have
in their collection when they began to build models of what a face looks like? 
It just seems like the darker the toner of skin, the less likely one would have
gotten a match with their facial recognition algorithm. 

**But it's not**; the faces aren't invisible, the features not obscured. I'm really
convinced that due to a lack of priming from a company that can literally cover
my city with printed sheets of paper with its image search index the images of
the two of us were classed as the distinct relatives of [Grogg][11]. Mind you,
other photos with this person where it matched perfectly fine; with the only
difference was that we were facing the sun and not putting our backs to it.

> For the continued privacy of my friend, I can't even place images of matches
> with her; so don't ask for said images.

## So What? We Taking Group Photos?
One can only assume how much of a deal this might be to Google. The chief
architect didn't think it was a good thing. My tweet following is one a _LOT_ of
people somehow over looked; at least the first sentence.

{% twitter https://twitter.com/yonatanzunger/status/615355996114804737 %}

Will they lose money over the fact that darker-toned Black faces aren't that
matchable or detectable by their systems? Not necessarily, as far as I can tell.
Things of monetary value to companies for profit tend to be prioritized.
The whole sensationalizing of this event was partially necessary just because
things like this show the implicit, unchecked and ever-present bias that
exists in technology. It can be matching a face or [matching the level of respect
and value of other companies that get funding][12]; the handling of Black
people in technology seems unfathomable for these tech giants who are
otherwise "too big to fail".

Someone suggested that I take a bunch of photos and zip them over Google.
Supposedly I'd sit in comfort that my few hundred photos out of the potential
millions already primed and favored in an algorithm that probably leans towards
more on the neural side than on something similar to a Markov chain. What now?
That would be a band aid over the more pressing but "invisible" problem: Anyone
but the creator of a tool is a second thought.

One solution would be having a team that's diverse _and_ from intersections broad
in scopes of culture, background and experiences so that if a tool or device were
to be created; the intended audiences become apparent; not only because the
presenter is palatable. Some companies find this difficult. I find their viewing
of that as terrifying. Let's be real; companies hire people who think they won't
give them any problem at all. The less trips to HR, the better! But when you
have a company that's homogeneous in its White structure, it takes a hell of
amount of "work" on their behalf to shift culture (if it genuinely exists) and
values to respect a more fluid and dynamic environment for people. It's like
taking a tub of vanilla ice cream and trying to make it into a Neapolitan
variety without losing any vanilla. Fortunately, we have the option of expanding
here; that tub does not.

Another solution very specific to the Google Photos situation would be
consulting with a photography agency that specializes in people of different
backgrounds and have them provide paid content that'd help in the priming
process of their image recognition models whilst giving credit to said agencies
to help them gain more of a foot hold in their respectable field. If Google's
willing to do this[^3], they know my email address and can hit me up about a few
people willing to cooperate.

---

This went from a rant about why machine learning and dark Black faces can be
problematic for Silicon Valley's White technologies to frustration over the
infallible homogeneous nature of technologies that are built nowadays that
legitimately give no shits about anyone but the 'stereotypical White person'.

[sh]: http://hanselman.com
[eb]: https://twitter.com/ericajoy/
[1]: https://photos.google.com/search
[2]: https://www.google.com/intl/en/photos/about/
[3]: /work/resume/
[4]: /about/
[5]: http://arstechnica.com/business/2015/06/google-dev-apologizes-after-photos-app-tags-black-people-as-gorillas/
[6]: https://www.theverge.com/2015/7/1/8880363/google-apologizes-photos-app-tags-two-black-people-gorillas/
[7]: http://www.huffingtonpost.com/2015/07/02/google-black-people-goril_n_7717008.html/
[8]: http://www.bbc.com/news/technology-33347866
[9]: http://bits.blogs.nytimes.com/2015/07/01/google-photos-mistakenly-labels-black-people-gorillas/
[10]: http://www.phonearena.com/phones/Google-Nexus-4_id7531
[11]: http://marvel.wikia.com/Grogg_(Earth-616)
[12]: https://medium.com/@blastchatbleez/black-ideas-matter-10345d0b4d2b#a967
[13]: https://encrypted.google.com/diversity/
[14]: https://www.crunchbase.com/organization/google/investments
[^1]: Some of the publications need to take advantage of caching oEmbed content instead of taking screenshots of things. A bit of semantic information (relative time-stamps) are lost in screenshots of tweets.
[^2]: [I've worked at Google before as an intern][3].
[^3]: [You guys have the capital][14].
