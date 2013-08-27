---
layout: post
title: "Is moving offshore really crazy?"
date: 2013-08-27 18:49
comments: true
categories: 
---

Today ZDNet published an article titled "[The lunacy of trying to avoid NSA spying by moving e-mail and cloud out of the US](http://www.zdnet.com/the-lunacy-of-trying-to-avoid-nsa-spying-by-moving-e-mail-and-cloud-out-of-the-us-7000019908/)" - I'm still trying to figure out if the position is naive, or intentionally ignores important facts.

In short, the author ([Steven J. Vaughan-Nichols](http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/)) states that your data is safer in the US because outside of the US, the NSA has much less restrictive rules to operate under. This is actually true - the NSA is a spy agency; like most spy agencies, they spy on people.

For those outside of the US, or those that routinely communicate  with those that are outside of the US - as far as the NSA goes, you are fair game. Anything and everything you do, if they can see it, they'll use. So on that point, ZDNet was right.

But their points only hold true if you ignore cryptography.

When your data is outside the US, you have to rely on encryption to protect your data; inside the US you have to rely on [FISC](https://epic.org/privacy/terrorism/fisa/fisc.html) to protect you. The [Lavabit affair](http://arstechnica.com/tech-policy/2013/08/how-might-the-feds-have-snooped-on-lavabit/) (or Hushmail if you want another example) should make it clear that inside the US, encrypted data held by a third-party shouldn't be seen as secure as it once was - for that matter, it probably shouldn't be viewed as secure at all (if your adversary is the US Government; in which case, you don't have much hope anyway).

When somebody posted a link to the article, I made my point short and sweet: 

{% tweet https://twitter.com/adamcaudill/status/372469441922998272 align='center' %}

It's hard to break properly implemented, strong cryptography - on the other hand, getting FISC to order a provider to hand over your data seems to be [quite simple](https://www.eff.org/deeplinks/2013/08/nsa-spying-three-pillars-government-trust-have-fallen). Given the choice of relying on encryption or a rubber-stamp court to protect my data - the right choice seems obvious.

Now, in all fairness, it's worth noting that the NSA likes to collect and examine encrypted communication more than other things - and the odds of your data passing through the NSA is certainly higher if your data is offshore. If properly encrypted though, the odds of them seeing the content is reduced.

So is it insane to move data offshore to avoid the NSA? If you want them to not see anything you do, then yes, yes it is. If you want to reduce the odds of them seeing the content - it's actually a reasonably prudent move.
