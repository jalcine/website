---
layout: post
title: Keep That Blade Sharp
byline: A coding journal, written in code.
category: thoughts
javascripts:
 - https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML
tags:
  - personal
  - development
---

In lieu of the new languages that sprout out ever so often, I've created a
[little repository][1] of source code that'd allow me to take well formed
concepts and ideas to see how it'd be represented in another language while
taking advantage of the capabilities of said language. The languages I want to
tackle are [listed on its README][2] and I'll try to update this thing at most
weekly so that I can experiment with just the basis of languages.

The reason why I didn't want to pick up a whole big process for this is largely
because this is like a notebook for me. I think I'll be very liberal with
comments and end up revisiting some of the examples I use there so I can see how
my understanding of said language changes over time. A coding journal written in
code.

For example, I'd start off with a simple math problem that's typically used to
explain recursion in programming, [a Fibonacci number generator][3]. For
completeness, let's define the expression here using the [recurrence
relation][5]:

$$
\begin{align*}
F_{n} = F_{n-1} + F_{n-2},\
F_{0} = 0, F_{1} = 1
\end{align*}
$$

Simple, no? We'll make use of the benchmarking library in Ruby so that we can
generate timestamps for every high-level execution of the Fibonacci function.
The code for this would look like the following:

{% highlight ruby linenos %}
require 'benchmark'

def fib(n)
  n < 2 ? n : fib(n - 1) + fib(n - 2)
end

def gen_fib(n)
  fib_no = 0
  time_elasped = Benchmark.measure { fib_no = fib(n) }.total
  puts "fib(#{n}) = #{fib_no} (#{time_elasped} s)"
end

gen_fib(0)
gen_fib(1)
gen_fib(7)
gen_fib(10)
gen_fib(130)
{% endhighlight %}

The full source can be examined [here][4][^1]. The output for the above
source file would look something like the following[^2]:

{% highlight bash %}
$ ruby ruby/fib.rb
fib(0) = 0 (0.0 s)
fib(1) = 1 (0.0 s)
fib(7) = 13 (0.0 s)
fib(10) = 55 (0.0 s)
fib(130) = 659034621587630041982498215 (0.0 s)
{% endhighlight %}

With one file, I went over a few things that'd help when writing larger programs
with Ruby. Timing, string manipulation, math and a logic tree that one might
take when going about things in their programming adventures.

---

Whilst searching for some information on Go and Ruby, I ran across
[Rosetta Code][]. This actually does what I would have wanted but it's way
more concise than I'd care for. And I didn't do it; writing the code myself and
testing it against a premise allows for self learning. Copy pasta can't save
you all of the time!

[1]: http://git.jacky.wtf/getting-started
[2]: http://git.jacky.wtf/getting-started/tree/README.markdown?h=develop
[3]: https://en.wikipedia.org/wiki/Fibonacci_number#Combinatorial_identities
[4]: http://git.jacky.wtf/getting-started/tree/ruby/fib.rb?h=develop
[5]: https://en.wikipedia.org/wiki/Recurrence_relation
[^1]: Check that folder for more Fibonacci solutions; recursion's not the only way to solve it.
[^2]: Totally cheated here; made use of an array to store already solved answers, hence timing results.
[rosetta code]: http://rosettacode.org/
