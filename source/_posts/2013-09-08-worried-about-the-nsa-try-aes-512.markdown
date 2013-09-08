---
layout: post
title: "Worried about the NSA? Try AES-512!"
date: 2013-09-08 13:07
comments: true
categories: 
---

*[…or, The Cost of Wild Speculation]*

"We need to boost our security - I think the NSA has broken everything we use. AES-256 is too weak, I don't trust it. Find a way to implement AES-512."

Double-AES-256! It'd be easy, and double encrypting has [never bitten us](https://en.wikipedia.org/wiki/Meet-in-the-middle_attack) before. So, let's write some code!

{% codeblock lang:ruby AES-512 / Double-AES-256 - aes512.rb %}
def encrypt(msg, iv, key)
  return e(e(msg, iv, key.slice(0..31)), iv, key.slice(32..63))
end

def decrypt(cipher, iv, key)
  return d(d(cipher, iv, key.slice(32..63)), iv, key.slice(0..31))
end

def e(msg, iv, key)
  aes = OpenSSL::Cipher.new('AES-256-CBC')

  aes.encrypt
  aes.key = key
  aes.iv = iv

  data = aes.update(msg) + aes.final

  return data
end

def d(cipher, iv, key)
  aes = OpenSSL::Cipher.new("AES-256-CBC")

  aes.decrypt
  aes.key = key
  aes.iv = iv

  data = aes.update(cipher) + aes.final

  return data
end
{% endcodeblock %}

This (somewhat) hypothetical conversation is becoming more common in the face of uncertainty and wild speculation. We have seen a glimpse into the greatest adversary that cryptography has. And we've learned almost nothing.

We know they have attacks, but we don't know against what. Is Diffie-Hellman broken? Is ECC backdoored? Has the [RSA problem](https://en.wikipedia.org/wiki/RSA_problem) been solved? Or maybe they've only found a somewhat more efficient way to factor  RSA keys? I've also heard speculation that they've broken RC4. They might have backdoors in OpenSSL or Microsoft's CAPI.

We have no idea.

Here's what we do know, in the past, uncertainty and speculation drove adoption of snake-oil solutions. Flawed, nonsensical technologies that just did more harm than good. Speculation today risks driving people from something that's safe, to tools that leave them fully exposed.

It's hard to give pragmatic advice in the face such uncertainty; but we must be cautious, we must not panic. I won't accuse anyone of over-reacting, as what we have seen is startling to say the least - but there are bigger risks to consider.

For example, let's assume for just a moment that the NSA has, in fact, influenced the ECC specification to include curves with weaknesses known to itself. What are the risks?

1. The NSA is able to decrypt messages at will.
2. A well equipped adversary (say, another state funded group) could discover the flaw, and exploit it.

Neither of those give me warm-fuzzies, but there are worse things: in the panic over "OMG - ECC is broken" people hastily switch to magic solutions that rely on obscurity and have no proven security, or to hastily implemented, poorly configured solutions that make them vulnerable to not only nation-state level adversaries, but much smaller ones as well.

If in the panic over ECC one was to move to an RSA based system with weak keys - they are likely to be far more vulnerable than they would have been, had they done nothing at all.

This of course applies to many scenarios, not just ECC - and personally, I trust ECC over RSA, at lease when using [curve25519](http://cr.yp.to/ecdh.html) or other non-NSA supplied curves.

There are no good answers to be found right now; all we can do is exercise caution and try to keep people from over-reacting and making their problems worse.

*[N.B. I realize that meet-in-the-middle isn't practical against AES-256 with technology as we know it, but it had to be pointed out. Also, please, **please** don't use the double AES-256 / AES-512 code. Really. Just don't.]*