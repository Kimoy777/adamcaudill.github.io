---
layout: post
title: "Password Hashing: No Silver Bullets"
date: 2013-05-07 18:48
comments: true
categories: 
---

In the dark days of the web, if a service hashed your password instead of storing it in plain text, they were doing good. As sites were hacked, and credentials stolen, a silver bullet emerged: always hash *and* salt passwords when storing them. Many, many services were built with this design - [LivingSocial](http://arstechnica.com/security/2013/04/why-livingsocials-50-million-password-breach-is-graver-than-you-may-think/) is a great example. SHA1 hashing with a 40 byte salt - once upon a time, that was considered reasonable protection. Today, you'll be blasted by industry insiders and the media for that.

We all so often rush to criticize companies for not being on the cutting edge of security - but how often do any of us look at why? Do we ever ask who's really at fault? Is the company at fault for not putting the money into updating systems, is it the engineers and architects for not knowing what they should do, or could it be something else - could the advice companies receive be part of the problem?

Looking at some recent breaches and the overall security position of the companies involved - it's easy to see which companies get it and which don't. There's one recent example where I really believe the company and its staff were simply incompetent. From top to bottom, they showed little thought for security, privacy, or user trust (for obvious reasons, I'm not naming names). LivingSocial and some others - I'm less sure about, when those systems were designed they were likely following "best practices" - or at least what developers thought were best practices.

For a number of years many developers saw SHA1 + a strong salt as a silver bullet. They implemented and stopped thinking.

The problem is, attackers are advancing far faster than companies can adapt, and best practices that may be right for today will soon fail the "reasonable protection" test. Engineers and architects see a best practices document and build to that standard - if that document is even a couple years old, what they build is hopelessly dated and won't provide the security the need.

Once that system is built - unless there's a breach, what incentive is there to change it? At many companies it's a constant fight to fund security related changes; when the change is to fix a system that's only broken in the eyes of experts, and (to management) only matters if some other layer of security fails, you can expect a fight for that money.

Fixing things that aren't obviously broken is hard. For those signing the checks, it's not obvious that what was "best practice" a few years ago is today a disaster waiting to happen.

There are many problems here, best practices are dated and inaccurate, there isn't enough focus on secure storage, and there needs to be more push for better, more actionable recommendations that stand the test of time. While there are no silver bullets, surely as an industry we can do better than this.

**Secure Storage**

If I can get everything I need to start brute-forceing passwords from a simple SQL injection attack against your `users` table - your users are at risk. It doesn't matter if your using SHA1 or `scrypt` - one day you'll be breached, and passwords will be exposed. It's that simple. 

The salt, the hash, or (probably better) both should be encrypted. It won't help you in case your server is breached, but it'll help if you're hit with a SQL injection attack or other attacks that allow access to data, but not the system itself. As always, it's not a silver bullet, but it adds protection in some situations, and anything you can do to make life harder for an attacker is a good thing.

This of course opens up the age old question of storing the encryption key, which I'll leave as an exercise to the reader. This can be taken to the next level, encrypt the salt & hash with an HSM - provides the best security, but that's rarely an option because of expense.

There is some debate over this in the industry, but I'm a big fan of defense in depth - don't make things easier for attackers.

**Useful Recommendations**

Crypto is hard, often confusing, and too often there is conflicting information. Implementing hash + salt is easy (and stupid), PBKDF2 is fairly simple - but you have to answer a couple questions:

* Hash Function - SHA1-HMAC is a common option thanks to wide compatibility, though using a member of the SHA2 family would be far more appropriate.
* Iteration Count - There's no real consensus on this, some say it should double every two years (so this year it would be 96,000), others say it should be tuned to your server.

Iteration count here is a real issue - if you blindly double every two years you risk server stability, on the other hand if you tune it to your server, you risk not keeping up with attackers. There's no winning, no easy answer. When it comes to password brute-forcing, the advantage goes to the attacker - having faster hardware and more optimized software is common. It's the job of the defender to constantly play catch-up.

With `scrypt` the options are even more complex, with too little obvious documentation to get developers going in the right direction.

**Dynamic Adjustment**

For example, the [Ruby scrypt](https://github.com/pbhogan/scrypt) implementation makes it quite easy to dynamically adjust cost settings - though if you run it on dated hardware, you run the risk of giving the attackers even more of an advantage. For those tied to PBKDF2 for some reason (i.e. compatibility), it would be easy enough to come up with dynamic adjustment code based on either performance benchmarking or date (following the somewhat risky double every two years approach).

Designing for dynamic adjustment gives defenders the best chance of staying current without costly upgrades. Again, not a silver bullet, but gives defenders a fighting chance of keeping up.

**The Future**

What I've been looking for is a strongly opinionated library in the spirit of NaCl - secure by default, and hard to make insecure. For now, it's clear that it should be based on `scrypt` - but ideally it could be easily updated in the future to use the winner of the [Password Hashing Competition](https://password-hashing.net/).

Here's what I'd like to see:

* Based on scrypt.
* Easily updated to support new algorithms (with backwards compatibility).
* Single cost setting, ideally based on approximate execution time.
* Function output encrypted with AES256.
* Reasonable minimum settings to prevent insecure usage.

Something like that could be handed to a developer with minimal instruction, and allow them to provide reasonable protection today and in the (near) future. There are times when giving people what they want (options, control, etc.) does more harm than good - give developers just what they need, no more, no less.
