---
layout: post
title: "Do one thing right..."
date: 2013-07-04 10:45
comments: true
categories: 
---

Everybody's favorite whipping boy, [Cryptocat](https://crypto.cat/) is back in the news today - and it's *bad*. Really bad. Steve Thomas has [found](http://tobtu.com/decryptocat.php) a major flaw in the way Cryptocat generated ECC keys. Due to this flaw, the keyspace was only `2^54.15`, well below a secure level. Add a [meet in the middle](http://en.wikipedia.org/wiki/Meet-in-the-middle_attack) attack, and this is further reduced to `2^27.08` - which based on my rough estimates, is just slightly more secure than a paper bag.

The end result is of course, that anyone can crack the keys in a frighteningly short amount of time.

This flaw basically means that any group messages sent for nearly a year (a figure [disputed](https://blog.crypto.cat/2013/07/new-critical-vulnerability-in-cryptocat-details/) by the project) are wide open to attack. Personally, I would operate under the assumption that any message sent during that time has been read (or will be) - hopefully by somebody not interested in you. Probably hasn't, but there's no way to know. 

**If you're going to do one thing, do it right.**

Cryptocat has one mission, to provide secure communication - which is to say, to encrypt data. The most vital step in any crypto system is the key generation; if you get it wrong, nothing else matters. That code should be well reviewed and understood by multiple people. Cryptocat got this wrong.

Steve does a great job explaining the issue here; but the short version is that the person that wrote the code - and anyone that's reviewed it since then, didn't understand what they were doing. That simple.

When you release code like this to the public, and encourage people to use it - especially those that are at higher risk (i.e. activists), you take on a certain responsibility for ensuring that at least the core functionality is doing what's expected. In this case, the team behind Cryptocat failed. For a year, the entire user base was at risk.

I recently mentioned Cryptocat in my [OPSEC](http://adamcaudill.com/2013/06/19/opsec-the-nsa-and-you/) article:

{% blockquote %}
Last year was painful for Cryptocat - the last audit may have been clean, but who knows what else may be found.
{% endblockquote %}

When I wrote that, I wasn't expecting it to be a bug that rendered the group chat encryption nearly pointless. While in [their](https://blog.crypto.cat/2013/07/new-critical-vulnerability-in-cryptocat-details/) blog post they seem to downplay the issue, I won't - for a year, group chat was *completely broken*.

**Crypto Is Hard**

There's no doubt that crypto is hard, everybody agrees on that. Or said more accurately, doing it right is hard.

{% tweet https://twitter.com/matthew_d_green/status/352815917924757505 align='center' %}

Writing key generation code scares me, I'm paranoid that I'll get it wrong. So I take extra time to review it in detail. Then have other people review it in detail. I don't release it to a 'production' environment until I'm sure as I can be that it's right. Can mistakes still make it in that way? Sure - but the odds are a lot lower.

This kind of code needs to be reviewed by those competent in crypto systems, and built to a specification that was designed by a real cryptographer. It can be expensive and time consuming, but that's what it takes to keep the promises an application like Cryptocat makes.

{% tweet https://twitter.com/matthew_d_green/status/352816626170728450 align='center' %}

**Just how bad could it be?**

Based on recent disclosures, we know that the NSA has decided to store encrypted communication for later analysis, and I think it's safe to say that other countries follow suit. So it's likely there are stored Cryptocat communications floating around in various spy agency archives. These agencies may have already found this issue and used it to view messages, or now that it's public - they can do so easily.

This is where an issue like this can be so devastating, if those encrypted messages have been saved anywhere - any users engaged in activity that their local government doesn't care for are now at risk.

Personally, I wouldn't trust Cryptocat until it's had a true code audit (the pen-test they had last year clearly doesn't count), and the crypto systems reviewed by a true cryptographer. If a mistake like this was allowed in, and overlooked for so long, I've no doubt that other weaknesses exist.
