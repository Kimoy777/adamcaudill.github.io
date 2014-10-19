---
layout: post
title: "On NSA-Proof Security"
date: 2014-10-19 18:51
comments: true
categories: 
---

{% tweet https://twitter.com/zooko/status/512264453228744704 align='center' %}

For a long time, “military grade encryption” has been a red flag for snake oil, over-hyped, under-performing garbage, so much so that it’s become a punchline. Anytime that phrase is seen, it’s assumed that the product is a joke - quite possibly doing more harm than good.

Since Snowden dropped his document cache, opening the world’s eyes to what’s been going on behind the scenes at what is likely the world’s most sophisticated attacker, NSA-Proof has become the new “military grade encryption” - marketing hype leading to instant ridicule by industry insiders. This phrase isn’t as simple though - the NSA isn’t a single dimensioned threat. So when talking about defenses, you have to think about not just avoiding the NSA, but avoiding the various attack classes they leverage.

### Fighting NSA Programs

When people talk about resisting the NSA, what exactly does that mean? As the NSA runs many programs, we have to look at the programs to see what could (or couldn’t) be real resistance. 

**[Tempora](https://en.wikipedia.org/wiki/Tempora)** (and similar projects) that tap backbone links, siphoning data en mass for later processing. Projects like this gather as much as possible, with no concern for who’s data they are looking at.

These efforts are passive, they see what’s going over the fiber, but without changing it. So encryption, even opportunistic (which I’m [really not a fan](https://adamcaudill.com/2014/02/25/on-opportunistic-encryption/) of), prevents them from getting useful data. So TLS is NSA-Proof, from this very specific angle - it prevents them from **passively** collecting this data.

**[PRISM](https://en.wikipedia.org/wiki/PRISM)**, the infamous project whose exact role and function is still being debated. Metadata is king, [metadata kills](http://abcnews.go.com/blogs/headlines/2014/05/ex-nsa-chief-we-kill-people-based-on-metadata/). Metadata is easier to understand in bulk, and far easier to process than actual content for most (if not all) types of communication. Once you have enough of it, it’s far more valuable than the content it went with.

Want to protect against PRISM? Easy, kill all of the metadata. For a service provider, the less they know, the less they can be forced to hand-over. Email for example, is loaded with useful metadata, data that’s easily mined and correlated. Services and protocols that are being developed to be PRISM resistant are doing so by encrypting as much as possible, and minimizing the exposed metadata.

So, NSA-Proof is possible here as well, in a very specific angle. It’s harder to protect against than something like Tempora, but still doable with the right design.

**[TAO](https://en.wikipedia.org/wiki/Tailored_Access_Operations)** What about TAO, the NSA’s version of the special forces? Guarding against wide-scale NSA data collection is one thing, targeted activities are a different story.

I once suggested a [method for making Android NSA-Proof](https://adamcaudill.com/2013/09/06/making-android-nsa-proof/) (it involves thermite, so it’s fun too!), and if you are targeted by TAO, that’s probably the best bet. There are ways you can make their job harder, but as long as they can figure out where you are, there’s always the [implant](http://arstechnica.com/information-technology/2013/12/inside-the-nsas-leaked-catalog-of-surveillance-magic/) option.

So can you be NSA-Proof from TAO? Probably not. You can make your odds better, but if they are willing to put the effort in, sooner or later they’ll win unless you are very well funded, and willing to take extreme measures.

### Marketing Hype
Many journalists use similar terms, ‘NSA proof’, ‘NSA resistant’, ‘thwarting the NSA’, and a hundred others. While there’s a good chance it’s just more snake oil, it’s possible that there may be *some* truth to it.

When dealing with an adversary like the NSA - you have to consider which part of the NSA. They are after everyone with mass data collection, which is something that can be fought - with a high likelihood of success. Though as the the targeting becomes more focused, the odds start dropping. Once TAO is involved, only the best funded have any hope of resisting.

If a service claims to be ‘NSA-Proof’ - it could be true, to a limited extent. Such claims really need to be qualified; if a service makes this kind of claim, they should provide information of which programs (or program types) they are trying to resist.

### So, what does NSA resistance actually require?
This, obviously, isn’t an easy question and depends very much on the nature of the service. Though there are a few high-level things to look for:

* Strong, non-NSA backed crypto primitives. I’m a big fan of [NaCl](http://nacl.cr.yp.to/) because it’s fast, constant-time, secure crypto that doesn’t rely on anything backed by the NSA. To make it easier to use, it’s made portable (and extended) in [libsodium](https://github.com/jedisct1/libsodium). I won’t promote anti-NIST FUD, but some things should be questioned, such as the NIST ECC curves.
* Minimal metadata. The amount of information that can be extracted from messages should be at a minimum. Anything that’s exposed (username, user ID, public keys, etc.) can be used when collected en mass to begin mapping relationships and undoing the veil of anonymity.
* Encrypt everything in transit. As with metadata, anything in the clear going over the network can be captured, stored, analyzed - and in targeted cases, altered in various ways. Using TLS is a great start to this, as it removes the option for simple passive monitoring, though it shouldn’t be assumed to be enough. Active attackers can man-in-the-middle the server, passing a forged/stolen certificate. Certificate pinning, and additional layers of encryption help protect against these attacks.
* Server knows as little as possible. The more the server knows, the more the provider(s) can divulge - either by court order, or by more clandestine means. Even the simplest HTTP server logs can provide valuable information to such an attacker, especially when combined with other data sources.
* Encrypt everything in storage. When at rest, everything should be encrypted - if a device is compromised, it should reveal as little as possible. By encrypting everything based on the user’s password, only the user is able to access the data (though may be by force).
* Hide everything. The CIA at least once used a weather application to [hide a communication system](http://www.theguardian.com/world/2014/jul/09/germany-arrest-second-spy-accused-us-cia); it was only available when looking up weather for a certain city. Such techniques make it harder to spot the use of secure communication tools. This may seem a bit extreme, but there are good reasons to do it.

There’s more of course, these are just a few high points. Defending against an adversary that has a huge budget, doesn’t respect international law, has a rubber stamp court, and some of the best technical talent in the world requires - special - measures. Of course, the NSA isn’t the only player; it goes beyond [Five Eyes](https://en.wikipedia.org/wiki/Five_Eyes), every major power engages in such activity to some extent.

If you can provide a reasonable degree of protection against PRISM & [FISC](https://en.wikipedia.org/wiki/United_States_Foreign_Intelligence_Surveillance_Court), then you can expect to have equal odds with other players using the same attacks. Will it actually work? Who knows; there’s a lot that can go wrong, a lot of mistakes that can be made, so many ways a good intentioned developer can turn a secure system into a thin facade that offers no protection. The list above is a starting point, not the final requirements.

### Can it really be achieved?
Achieving real resistance to illegal surveillance is a huge challenge, but at least some degree of success can be had by taking simple measures. Ensuring that everything possible is encrypted, that all network traffic is encrypted, and the like will make it far more of a challenge for an attacker.

TAO-level resistance probably isn’t realistic, but lower levels are a real option, and should be pursued whenever possible. While calling anything ‘NSA proof’ should be seen as a red flag, there are real techniques to resist the NSA and other agencies that seek to invade the privacy of the world.
