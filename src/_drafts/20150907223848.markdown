---
layout: post
title: "Testing Routes with Hapi"
category: tutorials
image: none
tags:
  - hapi
  - chai
  - testing
date: 2015-09-07 22:39:34 EDT
---

I'm working on a personal project that makes uses of [Hapi][] for its API layer.
I've managed to go about in a mostly test-driven fashion and worked from the
bottom up (from data modeling up to the route definition). Whilst working on
the ability to test the response states of routes, I noticed a few problems when
using the [Chai][] plugin for HTTP testing, [`chai-http`][chai-http]. For
completeness, here is what I'm working with[^1]:

{% highlight javascript %}
// @file app/routes/animal.js
const Hapi = require('hapi')
let myServer = new Hapi.Server()

myServer.route({
  method: 'GET',
  path: '/magic',
  handler: (request, reply) => {
    reply('pokemon')
  }
})

module.exports = myServer
{% endhighlight %}

{% highlight javascript %}
// @file test/routes/animal_test.js
const Server = require('../../app/routes/animal')
const Chai = require('chai')

Chai.use(require('chai-http'))

// TODO: HOW?
{% endhighlight %}

That `TODO` part tripped me up. Checking Hapi's documentation, I noticed that
Hapi exposed a HTTP server object via [server.listener][]. This gave me the
idea of doing this:

{% highlight javascript %}
// @file test/routes/animal_test.js
const Server = require('../../app/routes/animal')
const Chai = require('chai')
const assert = Chai.assert

Chai.use(require('chai-http'))

const mockServer = Chai.request(Server.listener)

mockServer.get('/magic').end(function(err, res) {
  assert.isNull(err)
  assert.statusCode(res, 200)
  assert.equal(res.result, 'pokemon')
})
{% endhighlight %}

This _should_ work. But it didn't :cry:[^2]

{% highlight bash %}
⌂ hapi-chai-testing  λ  node --harmony test/routes/animal_test.js

~jacky/.nvm/versions/io.js/v3.0.0/lib/node_modules/chai/lib/chai/assertion.js:107
      throw new AssertionError(msg, {
      ^
AssertionError: expected [Error: socket hang up] to equal null
    at Function.assert.isNull (~jacky/.nvm/versions/io.js/v3.0.0/lib/node_modules/chai/lib/chai/interface/assert.js:314:32)
    at ~jacky/Development/Projects/hapi-chai-testing/test/routes/animal_test.js:12:10
    at Test.Request.callback (~jacky/.nvm/versions/io.js/v3.0.0/lib/node_modules/chai-http/node_modules/superagent/lib/node/index.js:746:30)
    at ClientRequest.<anonymous> (~jacky/.nvm/versions/io.js/v3.0.0/lib/node_modules/chai-http/node_modules/superagent/lib/node/index.js:711:10)
    at emitOne (events.js:77:13)
    at ClientRequest.emit (events.js:169:7)
    at Socket.socketOnEnd (_http_client.js:288:9)
    at emitNone (events.js:72:20)
    at Socket.emit (events.js:166:7)
    at endReadableNT (_stream_readable.js:889:12)
{% endhighlight %}

_Definitely_ not what I was looking for. And to be honest, I feel like this
requires me to get closer into how this works and I plan to make a follow-up
post to do this. In the interim, I've resorted to using [server.inject][] to
simulate requests:

{% highlight javascript %}
'use strict'

const Server = require('../../app/routes/animal')
const Chai = require('chai')
const assert = Chai.assert

const reqOpts = {
  method: 'GET',
  url: '/magic'
}

describe('Server', function () {
  it('gives me the work', function () {
    Server.inject(reqOpts, function (res) {
      assert.equal(res.statusCode, 200)
      assert.equal(res.result, 'pokemon')
    })
  })
})
{% endhighlight %}

Running this with [Mocha][] gave me this:

{% highlight bash %}
⌂ hapi-chai-testing  λ  mocha test/routes/animal_test.js


  Server
    ✓ gives me the work


  1 passing (33ms)
{% endhighlight %}

**Boom**. This kind of sucks. I really like the tools from Hapi and friends but
this little barrier of interoperability between libraries and larger projects
sucks. Again, since I found a _working_ solution, there's no heavy need for me
to get this working with `chai-http` at the moment. But if I or anyone else
figure this out, I'll be sure to provide a new blog post.

---

For compatibility information, this is me testing this on Hapi 9.3.0, but
this'll apply for older versions of Hapi (tested on 8.8.1, the version I'm using
in my project).

[hapi]: http://hapijs.com/
[chai]: http://chaijs.com/
[chap-http]: http://chaijs.com/plugins/chai-http
[server.listener]: http://hapijs.com/api#serverlistener
[server.inject]: http://hapijs.com/api#serverinjectoptions-callback
[mocha]: http://mochajs.org/
[1]: https://jacky.wtf
[^1]: I make use of ES6 keywords a lot _and_ I don't use semi-colons, we don't need them.
[^2]: For reference, this failed with node 0.12.0 and io.js 3.0.0 as well.
