---
layout: post
title: "The Evolution of Paranoia"
date: 2015-02-17 22:11
comments: true
categories: 
---

That researchers from Kaspersky Lab uncovered malware that uses [hard-drive firmware](https://blog.kaspersky.com/equation-hdd-malware/) has now been throughly discussed — perhaps too much for some people. It’s not exactly Earth-shattering news either, the idea has been discussed for years, and has been [publicly demonstrated](http://spritesmods.com/?art=hddhack). [Brandon Wilson](http://brandonw.net/) and I were even working proof of concept for SSD controllers to demonstrate this based on our [BadUSB](http://adamcaudill.com/2014/10/02/making-badusb-work-for-you-derbycon/) work.

This isn’t about that story, exactly. This is about paranoia, and how it has changed over the last few years — and even the last few months. 

I was talking to Brandon Wilson about the implications of Kaspersky’s discovery, and how, or even if, you could ever trust your platform. When you could have malicious firmware in key system components — hard drive, USB devices (keyboard, mouse, etc.), USB hub — and possibly others, how about the GPU or the webcam that’s in virtually all laptops, how could you ever feel secure? How would you ever even know about it? Every device that has updatable firmware is a possible target, and far too few of them use any form of effective security to prevent malicious changes.

I pointed out that I buy all of my computers and key hardware from stores, I don’t have any of it delivered. Why? [Interdiction](http://www.forbes.com/sites/erikkain/2013/12/29/report-nsa-intercepting-laptops-ordered-online-installing-spyware/).

If it has my name associated with it prior to being in my hands, how do I know that it’s not been tampered with? Prior to Edward Snowden, I would have said that it was paranoid, that taking such precautions was at best a waste of time and at worst a sign of delusion. Today? If you are working in a field where you could have useful information, it seems quite reasonable. Paranoia has evolved, it has changed, what was once unreasonable is now prudent.

It was of course known that such things were possible before Snowden, but the scale was unknown — and of course NSA and the FBI aren’t the only threats, if they are doing something, you can bet they are far from alone. When that Lenovo laptop was shipped from China, do you really think that the Chinese Government wouldn’t take that chance to step in to gather some extra information? Launch-day iPhones have been shipped directly from China, and so many other examples. If NSA can tamper with a shipment, so can any country that has even temporary access to a package; if it’s on their land, they can attack it.

The focus has been on what NSA does, but the information should be used not as a way to attack NSA, but to get an insight to the  global threats that everybody that could be of interest faces. It’s important to remember that they don’t just [target](http://www.theregister.co.uk/2014/02/03/nsa_gchq_accused_of_hacking_belgian_smartcard_crypto_guru/) [terrorists](http://arstechnica.com/tech-policy/2013/11/uk-spies-continue-quantum-insert-attack-via-linkedin-slashdot-pages/).

I recently had a person contact me, concerned that a device she had was compromised — while I could tell her that unless she was attracting attention from a major player she was likely safe, I couldn’t tell her that she actually was safe, or anything she could do to ensure that nothing was infected. As these techniques spread to more common attackers, the risks that average people will be targeted grows dramatically. Attacks not only get better over time, they become more widespread. From repressive regimes that outsource their attacks, to poorly supervised local law enforcement, to common malware — it’s only a matter of time.

{% tweet https://twitter.com/matthew_d_green/status/567869974246596609 align='center' %}

Defending against these attacks, without major changes from device manufacturers, is at best a nightmare; at worst, impossible. I have repeatedly called out USB controller manufacturers to secure their devices, as that’s the only way that BadUSB can be truly fixed. The same needs to be said for so many other device types — it’s up to device manufacturers to secure their products.

## The Chain of Trust

For any system to be secure, there must be trust at some point, which can then ensure that later layers are correct and untampered. By attacking firmware, the chain is defeated at its first link — attack the hardware at the lowest level, and nothing that comes later, including the operating system, can truly be trusted.

The more important impact though is not technical, but psychological. If a person doesn’t know what they can or can’t trust, they start to fear everything. For NSA, GCHQ, and countless other agencies in the same business, this is good news — if people can’t trust their computers or their phones, they will turn to less secure means of communication. This is also extremely bad for consumers, business, and investors — as these tools can be used not just to go after government selected targets (legitimate or otherwise), but for profit, for blackmail, for revenge, or just for a thrill.

## Targets

While the public focus of NSA is to combat terrorists, it’s been well documented that their targets go far beyond that — researchers, IT staff, business executives, you name it. Yet, I’m a citizen of the United States, and as such, I *shouldn’t* be a potential target for them (give or take being caught up because of people I know in other countries). Is that the end of the risk for me? No, not by a long shot.

While the [Five Eyes](https://en.wikipedia.org/wiki/Five_Eyes) countries share intelligence, they don’t share restrictions on who they can spy on. For GCHQ, whether I’m a citizen of the United States or of Afghanistan makes no difference, I’m a valid target under their laws. Canada, Germany, Russia, China, Taiwan — I’m not protected under their laws, if they think I could have interesting information, or access to interesting information, on any topic, I could be a target. So could you. What information do you have access to, who do you know, and what information could they have access to?

If you work in security, development, IT, telecom — that could mean that you have access to some information that some country would like to have. Is that paranoia? A few years ago, some would say yes — now that we have a better insight into the scope and scale of intelligence activities, we know it’s simply reality.

## Personal Threat Models

I have long encouraged people to have a personal threat model — what are your realistic threats? When talking to others, keep in mind that their threat model may be different than yours, and things you see as being paranoid could be quite prudent for them, due to the different risks they face.

For me, to be honest, I’m not that interesting to a foreign power — if anything, trading emails with Glenn Greenwald and trading tweets with people like [the grugq](https://twitter.com/thegrugq) has done more to make me a target than any professional activity. The information I can access because of my job is somewhat interesting, and is certainly of value — but more to the Russian Mob than to a foreign government. I pay attention to who I talk to, to what I make public, to what my accounts have access to, so I know what my risks are.

If you work for a more interesting company, or are engaged in research that could be useful, or even just know people that could be more interesting than you, your threats could be completely different. Of course, also have to factor in locations — if you are outside of the US and work for a company that could have interesting information, then your threats may be far more complex.

Defining the line between reasonable and paranoid is harder than ever, and may vary from person to person.
