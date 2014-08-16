---
layout: post
title: "SMIMP at the DEFCON Crypto Village"
date: 2014-08-16 00:00
comments: true
categories: 
---

Last week I gave a lighting talk at the DEFCON CryptoVillage on [SMIMP](http://smimp.org/). The talk went over the basics of why the project is needed, and how the specification works.

Here are the slides:

<iframe src="//www.slideshare.net/slideshow/embed_code/38040741?rel=0&startSlide=2" width="512" height="421" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

Here is a rough transcript of the talk:

*Slide 1:* I'm Adam Caudill, I’m a developer and security researcher; I work on a number of different things, but my recent work has been around privacy and secure messaging.

We all know that email security is a real problem, and thanks to a certain whistleblower we know those weaknesses are actively being exploited on a massive scale. I'm here to talk about some of the issues, and a project I've been working on called SMIMP. It's a secure messaging protocol that aims to address the use cases of email, and to be a viable option to replace email as we know it.

*Slide 2:* This image illustrates the issues with email better than anything I've seen.

It's decades old, wasn't designed for the threats that exist today, and as a result - this is what we've done to it. We've glued on various bits to make it look and feel like something it isn't. STARTTLS helps protect from passive monitoring, but that's only one attack vector out of so many - and even then, it's often opportunistic, so it fails open and is subject to Man In The Middle attacks. 

GPG helps protect message content, but it's hard for the average user to understand and doesn't do anything for metadata. 

No matter what we try to glue on to email, it's still a protocol that fails on many fronts.

*Slide 3:* Not only is email as it exists today not designed to provide any protection from state-level attackers, it doesn't even provide any protection from a rogue sysadmin. Thanks to the various bits that have been glued on over the years, it's a bit better when circumstances are ideal - but it still fails on so many fronts.

For a messaging protocol to have any chance of being secure, privacy and security need to be evaluated and included in every design decision, from the very first day - attempting to glue them on after the fact leads to the kind of failure we've seen with email.

I know I'm preaching to the choir here. We all know it's a mess, we all know it's a problem that needs to be addressed.

*Slide 4:* There are many people looking to make the situation better, and on many fronts, and these efforts  do help a little bit at a time - but often only for people that know how to leverage the tools, or can get others to implement solutions. For the vast majority of users, the current state of email security is pretty dismal.

The question is, does it make sense, in the long term, to keep trying to find ways to improve email with security focused clients (such as Mailpile), better self-hosting setups, fighting companies to implement STARTTLS, and so on. Or, should we be pushing for a new protocol that's built for security and privacy from the ground up? Avoiding the mistakes of the past, shedding the dead weight of obsolete protocols and techniques.

There are huge compatibility and interoperability issues that have to be addressed for any protocol to be successful of course - when you are trying to replace a system used by billions, dealing with legacy systems is something of a big deal.

The fact is, it *needs* to be replaced with something better, but even calling such an effort a massive undertaking is an understatement. But, if it is to be replaced, it needs to start with groups like this, so that what's built will live up to the demands that will be placed on it.

*Slide 5:* Towards the goal of finding a better option for email, I began writing a specification. If I'm going to complain about a problem I should offer a solution, right?

SMIMP is a general purpose messaging system designed with a few key goals in mind:

* Minimal metadata
* Encrypt as much as possible
* Covers existing email use cases
* Simple to use; normal users need to be able to use it
* Useable in corporate environments that have special handling requirements - such as HIPAA, SarbOx, etc. - This is a big advantage against options like bitmessage; there has to be a balance between security, and meeting the varying demands of the different environments this could be used in.

Another goal is ease of implementation - on both the client and server ends; so it's a REST-like web service, and the data is passed as JSON. This way developers can leverage well-tested code instead of writing everything from scratch. This also means that it's easy for people to host their own server with a minimal time / effort investment.

*Slide 6:* SMIMP is made up of two major components, identity management and messaging. I believe it's critical that these are combined into a single protocol to allow for key pain points in traditional email to be addressed - the largest being public key discovery. For GPG, this can be a real challenge for users, especially when trying to find the key for certain high-profile people; has anyone looked for Jacob Applebaum's key? It's Bad.

Every user has one public signing key in their profile information - the key is tied to the user's address, so to find a user's key, all you need is their address. This provides a clean, simple way to identify the appropriate key for a user. Of course, ideally users should verify public signing keys via a trusted channel such as a phone call.

To protect the integrity of the profile information, all changes are signed with the user's signing key, and includes the hash of the prior change - creating a hash chain from the first, to the most recent change, allowing for simple validation that the records haven't been altered.

To protect against a malicious server, there are a couple checks that clients can perform:

* Pin the most recent signing key, if it disappears from the user's profile, then the information is being truncated, possibly to force the use of a compromised key.
* Pin the original signing key from when the account was created; if that ever changes, that is a clear indication that the entire history for a user has been replaced.

On the messaging side, all messages and most metadata is encrypted; the only data exposed is the data needed for the server to function. There are multiple message types, so not only does it support email like messages, it supports custom, application specific messages; this allows other message-centric applications to use SMIMP as a transport, making it easier to build secure messaging applications.

There are a few anti-spam protections in place - seeing as the server won't be able to scan content anymore.

* Dynamic hashcash-like proof of work
* Blacklists to reject everything from an address or domain
* Whitelists to allow addresses or domains to bypass the proof of work check.

The envelope is JSON, for email, the message is JSON, the formats are extensible, making it easy to add new functionality.

Everything is designed around a simple set of principles:

* Secure
* Private
* Easy to implement
* Hard to screw-up

*Slide 7:* So, what's the status today...

The specification is still a work in progress and is available from smimp.org, along with more background of what it is, and why it's designed the way it is.

I wouldn't try building against it just yet, it's still too immature, but if anybody wants to put their 2 cents in, the specification is on github and pull requests are welcome. The goal here is to get feedback, address issues, and try to build a community driven specification - my goal isn't to write a specification myself and then push it on the world assuming it's perfect.

I've invested a fair bit of time into SMIMP, but it's certainly not perfect, and the final solution to the email problem may not be anything like SMIMP - and I'm fine with that.

What's needed is more people looking not at how to we glue more things on email, but looking at how could we replace it. We need to get more people talking about possible solutions, for more people to contribute to specifications, or write new ones, to get more people focused on the one goal that will actually fix email security - replacing it.

*Slide 8:* I encourage you to look at the specification, to think about how replacing email could be achieved, and find people to work with to achieve this.

If you have any questions, suggestions, or complaints - I'll be in the area for a bit.

Thanks!
