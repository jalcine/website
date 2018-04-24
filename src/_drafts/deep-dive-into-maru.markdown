---
layout: post
image: posts/deep-dive-into-maru.jpeg
title: A Deep Dive into Maru
excerpt: |
  A quick guide into using maru 0.12.5 for API building.
category: tutorial
tags:
  - elixir
  - web
  - maru
  - intro
---

When I was looking for a framework to use for [twch.at][]'s API, I decided on
using [maru][]. I explained a bit as to why [I didn't use Phoenix for
twch.at][2]. It's an Elixir micro-framework, implementing only the aspects
needed to provide endpoints to make requests against. If you're familiar with
[`grape`][] by Intridea, then this'll be familiar.


> ## Heads Up!
> I'm going to make lots of reference to code in this post. I've placed the
> sources for each region in a semi-contained fashion for your leisure on
> [Github][1]. At the time of writing, the version of `maru` used is `v0.12.5`. 
> The code examples will be locked to this. If you need more recent examples of
> code, check out <https://github.com/elixir-maru/maru_examples>.

## Getting Set Up

For each aspect of these examples, we'll be writing tests using [ExUnit][] to
make sure we're doing what we expect. Feel free to either [clone the example
repository][1] to get started. Our Mix project file would look something like
this:

{% highlight elixir %}
defmodule ExampleMaru.Mixfile do
  use Mix.Project

  def project() do
    [
      app: :maru_example,
      version: "0.0.1",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      deps: deps(),
    ]
  end

  def application() do
    [ 
      mod: { ExampleMaru.Application, [] },
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps() do
    [
      {:maru, "~> 0.12.0"},
    ]
  end
end
{% endhighlight %}

From here, we can run `mix deps.get`, provided that you've properly installed [Mix][] on your machine.

### Defining The Startup

We'll define an `Application` with a single supervisor for now tha


[twch.at]: http://app.twch.at/
[maru]: https://maru.readme.io/
[`grape`]: http://www.ruby-grape.org/
[exunit]: https://hexdocs.pm/ex_unit/ExUnit.html#summary
[mix]: https://elixir-lang.org/install.html
[1]: https://github.com/jalcine/deep-dive-into-maru-examples
[2]: {% post_url 2017-10-22-why-no-phoenix-in-twchat %}
[3]: 
