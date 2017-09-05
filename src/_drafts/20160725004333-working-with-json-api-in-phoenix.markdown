---
layout: post
title: "Working with JSON APIs in Phoenix in a Test Driven Fashion"
excerpt: >
  I had the pleasure of working with Phoenix, a MVC framework for building
  highly available Web applications. This post is a bit about how I went about
  approaching the evolution of my project in a test-driven fashion.
category: tutorial
tags:
 - elixir
 - json-api
 - guide
 - tdd
---

Whilst working on a side project, I've been investiaging the use of
[JSON-API][]. It's a standard for defining resources that one would want to have
frontend clients communicate with. Just head to the site to read more about it.
I've been working on this for [twchat][]'s backend system; reading about
Elixir's ability to handle extremely high loads made it the language of choice
when I decided to start out this project.

[json-api]: http://jsonapi.org
[twchat]: https://twch.at/about/
