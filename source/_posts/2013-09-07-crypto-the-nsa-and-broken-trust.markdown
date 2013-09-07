---
layout: post
title: "Crypto, the NSA, and Broken Trust"
date: 2013-09-07 13:04
comments: true
categories: 
---

Even as a child I was fascinated by cryptography - and often left the local librarians with puzzled looks thanks to the books I would check out. It's so elegantly simple, and yet massively complex. There is one very unusual property of crypto though - it's not about math or modes, it's about trust.

Cryptography, especially as used today, has the most wonderful dichotomy of trust; on one hand crypto, by it's very nature, is used in situations lacking trust. On the other hand, to use crypto - you have to trust *it*.

**But what is *it*?**

This is where it gets interesting - let's say you download [GPGTools](https://gpgtools.org/), what is the chain of trust?

{% tweet https://twitter.com/thegrugq/status/376323020945514497 align='center' %}

Here are some of the assumptions you make:

* The installer hasn't been tampered with by your ISP, their upstream providers, GPGTools' hosting company - all of this is before you even get to the people that publish the software! (And [we know](http://projects.wsj.com/surveillance-catalog/documents/267850-merged-finfly-isp/) this is being done.)
* The computer that built the binaries was free of malware, or other backdoors.
* The source code hadn't been modified, without the knowledge of the developers.
* The developers haven't modified the code to add backdoors or otherwise weaken it.
* The compiler, and other libraries are free of backdoors or other modifications that would alter the resulting binaries.

I could keep going, there's more - but this gives an idea of how many things you have to trust, not just for every application - but every update of every application.

You could compile everything yourself of course (if its' open source that is) - but that only eliminates some of these issues. You still have to trust the code, you still have to trust the developers.

Well, you could audit the code. If you know what you're doing - in a few weeks you might actually get to the point of installing it. Which of course there will be a new update by then.

**Can't we fix this?**

Some of it, yes - maybe. The Tor project is working on [deterministic builds](https://blog.torproject.org/blog/deterministic-builds-part-one-cyberwar-and-global-compromise), which would allow others to verify that the released binary was built from a specific revision of the source code. This is really quite impressive, and something I truly applaud them for.

But, that doesn't lessen the trust you place in the developers and the code - is it actually secure? Are the even competent to be doing this work? Are there bugs in the PRNG or key negotiation that could render the system pointless? There's still a level of trust required.

**What about the standards?**

We know that the government has sought to backdoor or weaken systems in the past - from things like the [Clipper chip](https://en.wikipedia.org/wiki/Clipper_chip); enforcing illogical [export restrictions](https://en.wikipedia.org/wiki/Export_of_cryptography_in_the_United_States), and trying to enact laws that [mandate backdoors](https://www.eff.org/deeplinks/2013/05/caleatwo) (CALEA II). Now, we know that after losing the Crypto Wars of the past, they have been clandestinely doing the [same things](http://www.theguardian.com/world/2013/sep/05/nsa-gchq-encryption-codes-security).

The single biggest things that you have to trust are the protocols and algorithms - they are the most complicated, and only a very small number of people are qualified to audit them. If the protocol has deliberate flaws, or there is a backdoor in the algorithm - then your efforts to encrypt may be for nothing.

**It's all about trust**

I'm a big fan of taking the "trust no one" position (and myself least of all), but in the world of cryptography - it's not that easy. Every step of the way you have to trust something.

{% tweet https://twitter.com/thegrugq/status/376328406419243008 align='center' %}

Some say, "trust but verify" - and I agree, but full verification is a dream that will never come true. There aren't enough qualified eyes, and there is far too much code involved.

With so many dependencies, so many places something malicious could be injected - it's almost overwhelming to think about. In my eyes though, the first, and most important step, is helping people to understand the chain of trust. If you understand what you are trusting, you can ask better questions.

There is no real answer here - this is simply how it is. If you use cryptography (and you aren't a true cryptographer), then you're taking a leap of faith. If you didn't compile all of the tools you use - it's an even bigger leap.

*[N.B. This article was planned before the [Bullrun](http://www.theguardian.com/world/2013/sep/05/nsa-gchq-encryption-codes-security) story broke; but in light of these recent events, I've updated and published this ahead of schedule.]*