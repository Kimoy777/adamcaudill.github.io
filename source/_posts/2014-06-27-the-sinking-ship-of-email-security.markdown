---
layout: post
title: "The Sinking Ship of E-Mail Security"
date: 2014-06-27 23:32
comments: true
categories: 
---

E-Mail, the venerable old standard for internet text messages, dating back to the early 1980s - and back to the early 1970s in other forms, has long been the "killer app" of the internet. While so many companies try to make the next great thing that'll capture users around the world - none of these compare to the success of e-mail. It is likely the single most entrenched application-layer protocol used today.

Thanks to [STELLARWIND](https://en.wikipedia.org/wiki/Stellar_Wind) and other NSA programs, we have also seen that it has failed in a very real, and very important way. 

But this isn't exactly news is it?

The security issues around e-mail - or rather the complete lack of security in the protocol has been well understood for decades. Yet, in all those years of existence, all we, as those that care about security have managed to do is glue ineffective solutions on it. 

**STARTTLS**

In the last year, since the scope of NSA's spying has been made clear to the world - and the reminder that the NSA isn't the only player in this game, the use of STARTTLS has [spread dramatically](https://www.google.com/transparencyreport/saferemail/?hl=en). Many people have worked hard to make this happen - and it really has made things better. Kinda.

While STARTTLS does enable TLS, thus encrypting the data over the wire, it's far from perfect:

 * Opportunistic - In the majority of occasions the encryption is opportunistic; meaning that certificates aren't validated, and if something goes wrong in the TLS negotiation, the connection will fail-open - passing data in the clear.
 * Server Trust - E-mail as it exists today places complete trust in not only the sending server, but also the recipients server - and every other relaying server. Any of these can log all correspondence, as the data is only encrypted during the transport. TLS can be added or dropped at any point in the chain, and this exposes multiple possible intercept points.

Based on the famous "SSL added and removed here" NSA slide, we see that even if the messages are sent over an encrypted connection, that doesn't mean they stay encrypted when moved around within a company. There are so many failure points that can lead to an attacker being able to collect data.

So if groups like the NSA want e-mail, it takes some extra effort thanks to STARTTLS, but it doesn't solve the problem.

**PGP / GPG**

PGP, and the compatible (and likely more commonly used) GPG are one of the best options people have to encrypt their email - but there's still a great deal of data exposed.

 * UX - The user experience for most applications goes beyond unfriendly, to the point of being actively hostile. I recently walked an experienced developer through setting up a key with Gpg4win - the process of getting everything setup and working was beyond painful. The only GPG wrapper that I've seen that isn't unreasonably difficult is GPGTools for OSX.
 * Web of Trust - The web of trust model that PGP uses is both genius and terrible. When a news organization started using PGP, I noticed that none of their keys were signed by anyone - so I tried explaining the concept to one of their journalists. After several tweets we moved the conversation to e-mail, which led to several multi-page emails. By the end, I think he was more confused than ever. Last I checked, their keys still aren't signed.
 * Metadata - [Metadata kills](http://abcnews.go.com/blogs/headlines/2014/05/ex-nsa-chief-we-kill-people-based-on-metadata/). It's scary but true - people die based on who they talk to. How long till an investigative journalist reporting on an organization not friendly to the US gets droned for emailing the wrong people? PGP doesn't hide who is emailed, the subject, or any of the headers. PGP encrypted email leaks useful information like a sieve.
 * Client Integration - Not many email clients natively support PGP, so most users have to encrypt manually, or use a third-party add-on. This can lead to interesting information leaks, such as saving unencrypted drafts to the server.
 * Mobile - Using PGP on a mobile device can be risky, as it requires storing the private key on devices that are likely to have known security issues. Many people recommend against it, as it puts the private key at too much risk.

So while PGP / GPG protects the content of email, it still is subject to metadata collection.

**S/MIME**

For those that don't like PGP, or want a better chance of having native support, there's S/MIME. Like PGP, S/MIME has it's share of issues which leave users with less protection than they realize.

 * Certificates - To use S/MIME, you have to have a certificate issued from a CA. The question is, how trustworthy is it? CAs have been hacked to issue bad certificates in the past, and nobody knows what an NSL could be used for when issued to a CA.
 * Key Escrow - Some CAs generate the private key on their side to allow them to provide a key escrow service. While this can be useful if you ever lose your key and want to read your email again, it also runs the risk of an unauthorized party getting access to the key.
 * Metadata - The metadata issues noted for PGP applies here as well. The subject, the recipients, the headers are all in clear text.

There are other various complaints around S/MIME that are well documented, and have been discussed countless times. The point is, it's another partial solution just glued onto email in an attempt to make it do something it was never designed to do. Be secure.

**The list goes on...**

Much work has went into other various add-ons, such as SPF and DKIM and others that attempt to do things that could have been done by default if e-mail had been designed with authentication, privacy, and security in mind.

When e-mail was designed, none of these issues were considered - people have been trying to find ways to fix that mistake for years. E-mail was open, plain text, security and privacy weren't considered - or at least not to the extent required.

For a system like e-mail to be secure, security has to be part of the core design, considered at every step. When security & privacy are an afterthought, something to just glue on - it's impossible to achieve either.

There are many efforts underway now to improve the situation, some such as [Mailpile](https://www.mailpile.is/), I greatly respect. Their goals are noble, their purpose is true - but I also think they are fighting the wrong battle. E-mail as we know it is flawed beyond repair - we can make it leak less, but for all the work trying to overcome the design flaws, it'll always be flawed. There's only one way for e-mail to ever be secure.

**Time for action!**

Over the past few months I've been working on a specification for a system to replace e-mail. I don't know if it'll ever go anywhere - but that's not the point. E-mail as we know it needs to be replaced - it can't be fixed. We need to be discussing how to eliminate email, not new ways to glue partial solutions on to it. STARTTLS isn't the answer, PGP isn't the answer, S/MIME isn't the answer - an entirely new protocol is.

I'm hoping to make the first public draft available in the next few weeks. If it's well received, I'll try to do what I can to get the system built. If not, then hopefully others will write competing specifications, and I'll aide them as I can.

My goal for the specification I'm writing is to encourage discussion - to get people talking about how to solve the problem. If it contributes in any way to a new system, a system that's designed from the beginning to be secure, then it's worth every minute that's been invested in it. We need to find a viable option that can replace the monstrosity that we have today.

I encourage everyone to think about solutions to this - how can we build a viable replacement to e-mail that meets the privacy and security goals, while being user friendly, and meeting the requirements of business and government environments. It's a hard problem to solve, but it can be solved. It's up to us to do it.
