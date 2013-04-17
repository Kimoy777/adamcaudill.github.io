---
layout: post
title: "1Password, PBKDF2, &amp; Implementation Flaws"
date: 2013-04-16 19:09
comments: true
categories: 
---

...or "Crypto Is Hard, Vol. 479"

Earlier today a tweet about a new feature for [oclHashcat-plus](http://hashcat.net/oclhashcat-plus/) started a truly interesting debate on Twitter over the implications. The new feature is the ability to crack [1Password](https://agilebits.com/onepassword) keychain files - at an impressive **3 million** passwords per second.

{% tweet https://twitter.com/hashcat/status/324172122039652355 align='center' %}

To achieve this speed, two optimizations were used - the first is in precomputing `ipad` and `opad` for SHA1-HMAC, this effectively cuts the number of SHA1 calls in half. This is clever, but not the part I'm interested in, it's the second optimization that I find interesting. 

1Password uses AES128, in [CBC mode](https://en.wikipedia.org/wiki/Block_cipher_modes_of_operation#Cipher-block_chaining_.28CBC.29) to encrypt data - and it's the design of CBC that enables the next optimization. If you have the wrong IV when you decrypt in CBC mode it corrupts the first block - but only the first block, the rest will be fine. It's this fact that seems to have been overlooked when 1Password was designed.

The final encryption key is derived from the user's password via PBKDF2. They generate a 320bit key (so two blocks or four calls to SHA1 after the precompute optimization); of those 320 bits, 128 bits go into the encryption key, another 128 bits go to the IV. For 1Password to work, it needs both the key and the IV - but *attackers don't*.

An attacker can look at later blocks to see if they are valid and ignore the first block, by ignoring the IV generation and the first encrypted block, the number of calls to SHA1 is again cut in half.

To their credit, [Jeffrey Goldberg](https://twitter.com/jpgoldberg) of [AgileBits](https://agilebits.com/) (the maker of 1Password) responded very quickly and provided details about what they are doing to address it, and joined in a very open discussion about the impact of how this was implemented. Depending on who you ask, this 'flaw' costs either 1 or 2 bits of entropy.

For the end user, it means that an attacker only needs to perform 50% of the SHA1 calls that the 1Password software needs (maybe only 25%, depending on how optimized the 1Password code is). When it comes to password cracking, that certainly seems less secure than what was intended. As flaws go it could be far worse, but it's likely less secure than intended.

And finally, after all of this, we come to the point:

**Crypto is hard, even for smart people.**

It's so easy to accidentally introduce weaknesses like this - everything looks right, but because of how they used PBKDF2 in combination with AES128-CBC, the end result is weaker than was intended. It's specific, fairly obscure (to many at least), details of how these two algorithms work, and how they were used together that led to this flaw.

AgileBits has made a lot of good decisions, and in general at least, seems to know what they are doing. I certainly don't mean to beat up on them, they've handled this very well and the issue is fairly small. I applaud them for discussing this so openly, it's hard to do - I know that from personal experience.

This should serve as a great example of why any new crypto implementation needs to be expert reviewed to make sure that it's right. Nobody gets it right every time, every code base needs to be reviewed, this could (but doesn't have to) happen to you.
