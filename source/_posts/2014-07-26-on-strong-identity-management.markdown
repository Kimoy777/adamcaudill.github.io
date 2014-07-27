---
layout: post
title: "On Strong Identity Management"
date: 2014-07-26 22:16
comments: true
categories: 
---

Alice wants to send an encrypted message to Bob; she knows his address, but doesn't know the public key that goes with that address. Using GPG, Alice would look up his address on a key server, the issue is of course that anyone can upload a key associated with Bob's address.

Using the "web of trust" model, Alice would look at the different keys and see which ones are signed, and if any of them are signed by people she knows. The problem is that Alice doesn't normally use GPG, and she hasn't marked the keys of the people she knows as trusted (I expect this is true for most casual GPG users), thus, she can't tell what key is signed by keys she should trust, versus the ones signed by keys she shouldn't.

In years of effort, this is still an issue.

There are many issues with this model, especially when it comes to casual users that don't understand the details of the "web of trust" - while GPG use is certainly going up thanks largely to the Snowden revelations, many of these users fit into the casual users group. Thanks to the complexities of the model, these users may not be getting the level of protection they think they are.

Here are just a few of these issues:

* Lack of strong linking - there isn't a strong, verifiable connection between a user's address, and their public key.
* Complex user interaction - to be useful, the user has to understand the web of trust model, and how to leverage it. Based on the discussions I've had with people that recently started using it, most don't get it.
* Key discovery - finding the right key can be a nightmare, especially for some people. When there are multiple "valid" keys published, each with signatures, it can be hard for novice users to figure out which one is right.

I could go on, but I think the point is clear - the web of trust works well for some users, but only the users that take the time to really understand it.

**The *IM* in SMIMP**

I've been drafting a [specification](https://github.com/smimp/smimp_spec) for a secure messaging protocol called [SMIMP](http://smimp.org/), as far as I'm concerned the Identity Management component is the most important part. It's what allows the rest to work - secure messaging isn't that hard, key handling and validation is where end user system start to fail.

To provide a strong identity management system, a few goals need to be met:

* Strong link between address and public key.
* Updates to identity information signed by the user to prevent unauthorized changes.
* Provide a full history, including all changes from the time the account was created.
* Use of a hash-chain to show that no changes have been removed.

The IM in SMIMP meets all of these. The suggested way of using the system is trust on first use, pinning on both the first and the most recent public key. It would also be wise for the user to validate the recipient's current public key via a trusted channel on first use, but that's something that rarely happens in practice.

To detect a malicious server, or modified traffic, the user's client should first check to see if the original public key has changed - if it has, it indicates that the user's information has been replaced in its entirety. Second, it should see if the most recent key is no longer listed in the user's history - if its been removed, it indicates that the user's history has been truncated, possibly in an attempt to encourage the use of a compromised key. These checks provide an easy way for client software to validate that keys can be trusted.

To make the system more useful, the SMIMP identity information includes more than just the public key (all of which are optional):

* Name
* Web site
* List of social media profiles
* Additional data (comments, or other data the user wishes to assert)

This provides a simple way to strongly tie addresses to public keys; thus making secure messaging easier and more understandable for casual / non-technical users. For a solution to be widely useable, it needs to be effective for everyone.

**The best solution?**

SMIMP may not be the best solution, and there are some things about it that I don't care for myself - such as exposure of more metadata than I'd like. But, it is a solution to the issues surrounding email, and identity management.

The [issues](https://adamcaudill.com/2014/06/27/the-sinking-ship-of-email-security/) of email security can be fixed, and identity management is part of that problem. There has to be a way to tie a user to their public key in a more reliable manor than what we have today (and without resorting to the mandatory government ID idea that won't die).

I encourage everyone to look at these issues, and think about possible solutions. Contribute to SMIMP or one of the other efforts to fix the issues around email; we can no longer ignore these issues. The community needs to find and implement solutions that assure the security and privacy of the global community.
