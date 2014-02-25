---
layout: post
title: "On Opportunistic Encryption"
date: 2014-02-25 14:51
comments: true
categories: 
---

Opportunistic encryption has become quite a hot topic recently, and blew up in a big way thanks to an [Internet Draft](https://en.wikipedia.org/wiki/Internet_Draft) that was published on February 14th for what amounts to sanctioned man-in-the-middle. Privacy advocates were quickly up in arms - but it's not that simple ([see here](http://tools.ietf.org/html/draft-loreto-httpbis-trusted-proxy20-01)). As [pointed out](http://hillbrad.typepad.com/blog/2014/02/trusted-proxies-and-privacy-wolves.html) by [Brad Hill](https://twitter.com/hillbrad), this isn't about HTTP**S** traffic, but HTTP traffic using unauthenticated TLS; thanks to poor wording in the document, it's easy to miss that fact if you just skim it.

It's routine practice for ISPs to MITM unencrypted traffic today; it's well known that [Comcast does it](https://blog.ryankearney.com/2013/01/comcast-caught-intercepting-and-altering-your-web-traffic/). This practice won't change once we move to HTTP2, regardless of unauthenticated TLS - the only question is will users know about it.

But this isn't about that single internet draft, it's about what this tells us about opportunistic encryption.

We've seen many smart people get very upset (myself included) over a misunderstanding about how opportunistic encryption fits into the new HTTP2 paradigm. What does that tell us about how it'll be perceived in the future?

**What does opportunistic encryption buy us?**

We can break attackers down into two classes:

* Active - Will intercept and re-route traffic, at small or large scale.
* Passive - Will watch what goes over the wire, but is unable or unwilling to interfere with it.

Opportunistic encryption prevents passive attackers from being able to collect data, they will either fail or be forced into an active role (if they are positioned and financed to do so). While many talk about increasing the cost of surveillance for groups like the NSA, I doubt that will create a substantial impact - we know that they are both active and passive today. So they are positioned for active attacks when they so desire, though there may be some reduction of monitoring lower value targets due to increased complexity / resource demands.

**What opportunistic encryption doesn't do**

Unauthenticated TLS skips the most vital step in the process - it doesn't verify that the server is actually the one you intend to talk to, meaning anyone that can control network traffic between you and the end server, can pretend to be the end server, monitoring all traffic. Which is, exactly what we have today with HTTP traffic.

So, you know your traffic is encrypted, what you don't know is who has the keys, or how many people have seen the traffic. You're safe from passive threats, but it provides no protection against active threats - but it's also not intended to.

**Should we pursue it?**

If people weren't involved - it eliminates a class of attacks without substantial costs, and forces passive attackers to become active. Overall, that sounds like a win, but there's a problem: people.

Opportunistic encryption isn't real security, it doesn't stand up to active attackers - it provides protection against only a specific type of attack. Real TLS provides protection against both active and passive threats. If people understood this, opportunistic encryption would be fine - but people don't understand that, that's clear.

If people see it as a "just works" alternative to real TLS, then the harm it does greatly outweighs the value it provides. It will give a false sense of security, when in reality there is none. 
