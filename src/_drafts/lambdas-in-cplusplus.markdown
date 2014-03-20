---
layout: post
title: "Lambdas In C++: A Rundown"
date: 2014-03-13 04:03:38 EDT
categories:
  - reference
  - c++
---

While working on Wintermute, I decided to glance more deeply into a feature of
C++ that deemed insanely useful for flexible programming. That's the
ever-famous *lambda*. Not too different from **functors (function objects)**
or **function pointors**, it allows for more compact code since you can
decouple named functions and pass a reference to the thing you'd expect to
pass on. It'll make more sense as this goes along.

## An Example

You got a class that represents, say, an address book. Typically you'd search
by name, phone number, maybe, address. With lambdas, you could have it search
for anything and result said results. Take a look[^1].

{% highlight c++ %}
#include <string>
#include <vector>

using std::string;
using std::vector;

struct Entry
{
  // Bonus points for making this more cozily set.
  string firstName;
  string lastName;
  string middleName;
};

class Rolodex {
};
{% endhighlight %}

[^1]: There's a thousand-and-one things wrong with this example. For info like
this and to allow for a standard ABI changes ... I digress ;)
