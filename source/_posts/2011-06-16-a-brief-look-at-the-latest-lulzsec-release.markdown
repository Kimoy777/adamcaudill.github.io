---
date: '2011-06-16 20:01:41'
layout: post
slug: a-brief-look-at-the-latest-lulzsec-release
status: publish
title: A brief look at the latest @LulzSec release
wordpress_id: '864'
categories:
- Security
tags:
- Security
---

Earlier today, the hacker collective [Lulz Security](http://lulzsecurity.com/) released a batch of 62,156 email/password combinations from unknown sites; I decided to take a look at the data and see if there was anything to be learned from it.

{% tweet http://twitter.com/LulzSec/status/81327464156119040 align='center' %}

So, let's take a look at a few stats:

Total Domains: ~5,230

Top 15 Domains:

![Top 15 Domains](http://adamcaudill.com/files/2011-06-16_1922.png)

There are over 50,000 unique passwords, but even with this many passwords, there's still a few quite common - and very bad passwords in use:

![Top Passwords](http://adamcaudill.com/files/2011-06-16_1936.png)

While this is a fairly small release, the [LulzSec](http://twitter.com/#!/LulzSec/) twitter stream has a number of entries like these:

{% tweet http://twitter.com/LulzSec/status/81334551686815745 align='center' %}

There are several tweets about people accessing Facebook, Twitter, and even Amazon accounts - what's so unfortunate here is that service providers could easily restrict accounts on lists like this to protect the users and greatly reduce the impact of these breaches.

Until people learn that password reuse is dangerous, this will keep happening.

_Update:_ I've removed a link to a tweet, as the account has since been removed. The tweet said: "@LulzSec Cheers for the paypal account with £250 in it! ;)"
