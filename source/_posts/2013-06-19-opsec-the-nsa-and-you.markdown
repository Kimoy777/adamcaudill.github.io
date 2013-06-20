---
layout: post
title: "OPSEC, The NSA, and You"
date: 2013-06-19 19:39
comments: true
categories: 
---

It's been two weeks since news broke about the NSA [collecting massive amounts of data](http://www.guardian.co.uk/world/2013/jun/06/nsa-phone-records-verizon-court-order) from Verizon; and likely everybody else. There's also [PRISM](http://www.guardian.co.uk/world/2013/jun/06/us-tech-giants-nsa-data) - whatever the hell that is - it seems there's no agreement on that, and I doubt there will be anytime soon. What really matters here though, is we have proof that people are watching - and if it's happening in the US, it's probably happening everywhere else.

If you have any understanding of the intelligence community, all of this should come as absolutely no surprise whatsoever.

For me, it has served as a reminder of the importance of OPSEC in anything you're doing. The NSA is collecting metadata, and lots of it - they repeatedly assure people that it's harmless. And it is - if you're a technophobic OPSEC master living in a cave. Where metadata is so valuable, is in cases where you are looking at people that leak little bits of personal data everywhere they go, then you use the metadata to connect the dots. Very soon, you have a great picture of what they are doing and who is involved - without needing access to voice recordings or other, more protected information.

**Knowing Where Your Weakness Is**

Many people are talking about tools and technologies now to defeat this kind of data collection - from Tor to Cryptocat, yet, there are issues; it sounds so simple, but it's not. Tor for example, how easy would it be for someone with a large budget to put the network at risk? The approximate answer, is [easy](http://grugq.github.io/blog/2013/06/10/good-luck-with-that/). How about Cryptocat or other encrypted communication tools? Last year was [painful](https://blog.crypto.cat/2012/11/security-update-our-first-full-audit/) for Cryptocat - the last audit may have been clean, but who knows what else may be found.

Encryption is hard, and it's very easy to write something that looks secure but falls apart when placed in the right hands - accidentally or otherwise.

The question is, is it effective against an actor with a massive budget? I would say it is, but not for the reason you might be thinking. Encryption is hard, both for those that implement and those that attack. But why spend the time and money on breaking encryption when you can take advantage of bad OPSEC to achieve the same goal?

People leak data constantly - how, when, and where they use their phone, who they email, how they use social networks - all of these things provide useful information for an attacker. Individually, they may seem to have no value, but it's the connections they add to the overall picture that makes them so damaging. 

Photo EXIF data, time of day trends in social media (or IRC), comments about the weather - all seem so innocent, but when combined can help to narrow down the list of candidates, and start building a picture of a person and their habits. Simple, innocuous, meaningless - until assembled.

No tool can fix this; using Tor doesn't eliminate habits, encrypting email doesn't hide social connections. Everything you do leaks data.

**Your Software Isn't The Big Risk**

You are. Your friends are. 

All the encryption software in the world won't protect you from posting a picture with GPS data embedded in it; no 0day will put you at more risk than you are from your own mouth. No major actor needs to crack encryption, when they can collect massive amounts of metadata, and play connect the dots with the data you give them for free.

It's even worse when you start talking to friends, what they know, they'll leak. When you speak to anyone, assume that a link between you and them has been documented by somebody, somewhere - now that person is a target to see what little bits of data they leak about you. Or you are now a target because of them.

Trust no one, not even yourself.

**Know Your Enemy**

As Sun Tzu [pointed out](https://en.wikipedia.org/wiki/The_Art_of_War), if you know your enemy - war is easy. The problem is, you don't. Nobody knows just how much data groups like the NSA have - if you believe them, not even the NSA knows. Nor does anyone know what they are capable of collecting should the need arise. Large groups of *very* intelligent people with a secret budget and access to a secret court that grants almost everything they ask for - my guess is that they're capable of a lot.

You know what tools are available - but how can you protect yourself, if you don't know what works and what doesn't? What networks are monitored? What agencies or companies are sharing data?

Having good tools is a start, but that must be part of a larger plan to control what you expose publicly. You must be very cautious about every bit of data that could be collected - no matter how insignificant it seems. Who you associate with and how needs to be carefully controlled to avoid both unwanted leaks and attention. Every action feeds data in a picture, how useful that picture is, is completely up to you.

Want to learn more, start with [grugq's HITB OPSEC talk](http://www.youtube.com/watch?v=9XaYdCdwiWU) if you've not seen it yet. If you'd like the short version, I'll sum it up: STFU.
