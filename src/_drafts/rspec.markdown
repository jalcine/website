---
layout: post
date: 2014-01-14 17:18:56 EST

---

> More of a recap of using RSpec for me, this post introduces different forms
> of testing (unit, feature, integration, etc) using RSpec.

## Preface Jazz
RSpec is a testing framework that's well known for being syntatical sugar for
testing. It comes with a lot of magic for mocks, stubs, and the likes
necessary to nuture a growing and evolving testing environment. It's popular
probably because of its syntax or mainly because of the wide adoption. I know
I use it because it works 98% of the time I need it to (otherwise I'd use
MiniTest, but that's another post).

RSpec is appealing mainly due its ability to target multiple genres of tests
like unit tests, feature tests, and integration tests. Before you'd go off
sayin' that Cucumber can do the same; let's compare some code for just that.

## Unit Testing

First, let's define a class that we should unit-test. Now, a classically fit
definition of unit testing would be **a test on individually isolated units 
of code**. In this, we'd go back to some good ol' geometry!

{% highlight ruby linenos %}
# figure.rb
class Figure
  attr_reader :sides
  def initialize(sides)
    @sides = sides
  end
end
{% endhighlight %}

{% highlight ruby linenos %}
# side.rb
class Side
  attr_reader :length
  def initialize(length)
    @length = length
  end
end
{% endhighlight %}

{% highlight ruby linenos %}
# spec/figure_spec.rb
require 'rspec/core'
require 'rspec/expectations'
require 'figure'
require 'side'

describe Figure do
  it 'has sides' do
    figure = Figure.new([Side.new(4), Side.new(6)])
    expect(figure.sides.length).to be(2)
  end
end
{% endhighlight %}

[rspec]: http://rspec.info/
[minitest]: http://docs.seattlerb.org/minitest/
[cucumber]: http://cukes.info/
