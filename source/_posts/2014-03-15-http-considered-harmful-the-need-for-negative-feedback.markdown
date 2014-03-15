---
layout: post
title: "HTTP Considered Harmful - The Need For Negative Feedback"
date: 2014-03-15 17:53
comments: true
categories: 
---

We all know, and well understand what this means when we see it in a browser:

{% img center /files/GitHub_EV_Cert.png %}

It means that the connection is encrypted, and that some degree of validation has occurred to verify that the server is who it claims to be. Through the years, users have been taught to trust sites when they see that, or the all too familiar 'lock' icon - when users see it, they assume their data is safe.

But what about this?

{% img center /files/reddit_no_ssl-2.png %}

There's no lock to tell them they are safe, but there's also no warning to indicate that the connection isn't secure. There's no encryption, no validation, - no protection at all. With HTTP, users are afforded nothing at all to protect them - but we all know that, right? Does the average user understand that though? Do they understand how easily they could be [monitored](http://arstechnica.com/tech-policy/2014/02/new-snowden-docs-show-nsa-gchq-spied-on-wikileaks-pirate-bay-users/), or how easily traffic can be [altered](https://www.schneier.com/blog/archives/2013/10/how_the_nsa_att.html)?

**The Need For Negative Feedback**

Strong negative feedback has long been used in browsers to warn against invalid or expired certificates - but there's no feedback to warn users of just how dangerous HTTP can be. After a discussion on Twitter, a friend of mine, [Taylor Hornby](https://twitter.com/defusesec), created a [mockup](https://defuse.ca/web-browser-negative-feedback.htm) of what could be done in Firefox to warn users:

{% img center /files/ff_no_ssl_xmockup-1.png %}

This provides simple, clear feedback to the user that they shouldn't trust the site - it doesn't present an error or anything to interrupt the user, but does make them aware of the risks they are taking.

We, the security community, owe it to users to provide them with useful feedback so that they can protect themselves - providing negative feedback in the browser showing the weakness of HTTP would be a large step in that direction - and to urge site owners to adopt HTTPS as soon as possible.
