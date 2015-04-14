---
layout: post
title: "Crypto Front Door: Everyone Welcome!"
date: 2015-04-13 01:10
comments: true
categories: 
---

{% img center /files/backdoor_frontdoor.png %}

For decades, the US Government has fought — sometimes with itself — to prevent the use of secure cryptography. During the first [crypto war](https://en.wikipedia.org/wiki/Crypto_Wars), they allowed strong cryptography within the US, but other countries were limited to small keys — making brute force attacks practical. But what about those pesky US citizens? They didn’t really want them to have strong crypto either — enter key escrow.

### What is key escrow?

According to [Wikipedia](https://en.wikipedia.org/wiki/Key_escrow):

{% blockquote %}
Key escrow is an arrangement in which the keys needed to decrypt encrypted data are held in escrow so that, under certain circumstances, an authorized third party may gain access to those keys. These third parties may include businesses, who may want access to employees’ private communications, or governments, who may wish to be able to view the contents of encrypted communications.
{% endblockquote %}

Essentially, it’s a system where someone other than the the owner of the data gets a copy of the key, that can be used to decrypt, without their permission. 

If the organization holding the escrow keys can surreptitiously access the data — such as retrieving it from a service provider, or capture the data from a public network, the data can be decrypted in complete secrecy. The owner of the key need not have any idea that it’s happened, or who did it. This property raises many privacy concerns — this takes a technical control and turns it into a policy matter.

{% pullquote %}
In general, {"if there’s noting other than a piece of paper protecting your data, it isn’t protected"} at all. In the case of government controlled key escrow, that’s exactly the situation. If an employee violates policy and accesses escrow keys without authorization, they have the potential to secretly access data — and it’s quite possible it would never be known by anyone. In every environment, from the NSA to the Certificate Authority system, where controls are purely policy based instead of being technical, have been bypassed for various purposes.
{% endpullquote %}

The most famous, or perhaps infamous, use of key escrow was the fundamentally flawed [Clipper chip](https://en.wikipedia.org/wiki/Clipper_chip) — an attempt by the US Government to allow encrypted calls, while allowing them easy access. Thankfully, this effort died, mostly taking key escrow with it — at least for a few years.

### A rose by any other name…

{% img center /files/backdoor_this_big.png %}

The Director of the NSA, Michael Rogers, has repeatedly called for the introduction of a “frontdoor” — which is a backdoor with a policy that says they have paperwork to do before they can use the keys they hold. The people of America, and the world, are to trust the secret rubber stamp court and the policies of various agencies with our most sensitive information — hoping they follow their own rules (which are probably also secret).

{% tweet https://twitter.com/isik5/status/587490182380843008 align='center' %}

While Rogers has done his best to convince people that there’s a difference, the fact is no matter what you call a backdoor — it’s still a backdoor. It’s still a way for someone that isn’t the owner of the data, to decrypt it, without their approval and quite possibly without their knowledge.

That looks just like the definition of the word backdoor:

{% blockquote %}
a feature or defect of a computer system that allows surreptitious unauthorized access to data.
{% endblockquote %}

### Massively Increased Complexity

The privacy concerns and potential for abuse aren’t the only cost for key escrow — the complexity of the system is greatly increased, and as with any systems, when complexity goes up, so does the risk of vulnerabilities. The risks are so clear, that even the US Government can’t agree on the plan — NIST has already spoken out against it.

{% tweet https://twitter.com/csoghoian/status/586646988269162496 align='center' %}

Rogers said: “*I want a front door. And I want the front door to have multiple locks.*” — what he’s really talking about is key escrow with splitting. In other words, taking a key and splitting it into two or more pieces, and these pieces would be held by separate entities. The data could only be decrypted when one entity shared their half of the key with the other (intentionally or otherwise).

This adds complexity in a few ways:

* Key Splitting — The splitting process has to be done properly to ensure that neither entity would be able to recover the full key without the cooperation of the other.
* Key Registration — When the encryption key is generated, it has to be split, and registered with the entities that will hold the parts. There are risks of data being lost in a number of ways here, and this registry would be a natural target for attack.
* Key Part Transport & Storage — Being a natural target for attack, the key parts need to be carefully handled throughout their lifetime.
* Key Recovery — Certain paperwork would be required to access the  key parts, this would be validated by a human — should that human ignore policy, or not verify paperwork, keys could be accessed without the proper authorization.
* Key Destruction — Once authorization expires, or the need for access has ended, the combined key and any copies of the key parts outside of the registry should be destroyed. If not properly handled, it would provide another avenue for unauthorized access.

Of course this is just a high level view, and there’s more — all of these additions, unnecessary today, add risks of flaws (accidental or intentional) that could expose data.

### Opening the floodgates…

One of the most astounding things to me about this proposal is the level of arrogance it demonstrates. The NSA (and similar organizations) has a strong preference for NOBUS (nobody but us) backdoors, and they are making the daring assumption that this will be a NOBUS backdoor.

For example, if the US Government receives a copy of iPhone encryption keys, a device made in China, do they really believe that the Chinese Government won’t take advantage of the situation to get a copy of the key as well? The US Government has set a clear precedent of using secret court orders to retrieve data — what makes them think that China would hesitate to order Foxconn’s facility in Shenzhen to provide it with a copy of all escrow key parts?

For companies with offices  outside of the US, or that deal with manufacturers outside of the US, there is real risk of them being targeted to get the keys before being delivered to the government. This is the same technique that [GCHQ used against Gemalto](https://firstlook.org/theintercept/2015/02/19/great-sim-heist/) to get keys for SIM cards.

To assume that the US Government can open Pandora’s box, and yet maintain control is sheer arrogance. This opens the door not only to vulnerabilities, but to other governments that want to get in on the game. Once the requirement is set, it *will* be widely abused.

