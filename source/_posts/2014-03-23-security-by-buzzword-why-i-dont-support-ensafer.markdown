---
layout: post
title: "Security By Buzzword - Why I don't support Ensafer"
date: 2014-03-23 12:28
comments: true
categories: 
---

**Update**: I had a call with Ensafer's CTO, Trygve Hardersen to discuss the issues I brought up, and what they can do about it. First, they updated the site so that downloads are now over HTTPS. He stated that the infrastructure that powers their service is separate from the website, and everything is over HTTPS. They are working on making documentation available, and hope to have the first documents available soon. Once I get a chance to look over their documentation, I'll post further updates.

[Ensafer](http://www.ensafer.com/) is an overlay to Dropbox that offers end-to-end encryption, the goal being to address privacy concerns that Dropbox can access user's files - and thus possibly the US Government (via NSLs, etc.). This sounds like a great idea - end to end encryption is the best way to prevent unjustified surveillance, and I do use a competing product ([Boxcryptor](https://www.boxcryptor.com/)), so I support the concept, but what about Ensafer's implementation - does it provide the level of security desired?

**Where are the details?**

If you look at Ensafer's site, you'll find precious few details on what they are doing - plenty of security buzzwords, but no specifics. Let's take a look at the [one page with details](https://ensafer.zendesk.com/hc/en-us/articles/200797297-Industry-standard-RSA-and-AES-cryptography): 

{% blockquote %}
Ensafer believes in standards and we don't use any custom encryption algorithms. Our encryption platform is built on:

2048-bit RSA keys
256-bit AES encryption
2048-bit SSL
PKCS#12 key containers
X.509 certificates
{% endblockquote %}

We see some algorithm names - but what about key derivation, or symmetric encryption modes? How about hashing algorithms? How and where is your password stored? There are so many implementation details that are critical for security, yet aren't talked about at all.

In December of 2012 I started asking about details, they pointed me back to the web site - when I pushed for more, I was told that they were working on a whitepaper to explain their implementation:

{% tweet https://twitter.com/Ensafer/status/275616564085149698 align='center' %}

More than a year later, I'm still waiting to see those details.

**So have they conducted an audit?**

Since they haven't released details publicly, if they conducted an external audit, that would bring some trust. So, recently I asked, and this is what they had to say:

{% tweet https://twitter.com/Ensafer/status/447156694041509889 align='center' %}

After the delay in getting useful details published, I'm not hopeful that we'll see the results of an audit in the near future.

**TLS & Safe Downloads**

I really wish that the lack of details was the only concern - but it's not. The first thing I noticed is that their web site doesn't force TLS, so I manually switched to HTTPS, unfortunately the result wasn't what I was hoping for:

{% img center /files/Ensafer_SSL_Error.png %}

Well, that's not encouraging. Let's take a look at the download link:

    http://get.ensafer.com/mac/prod/Ensafer-1.0.8.dmg

When you try the same link over HTTPS, it's even worse:

{% img center /files/ensafer_dl_no_tls.png %}

For a security product, I'd expect the download to be over HTTPS to prevent an attacker from redirecting a victim to a malicious version. This isn't the kind of mistake I'd expect from people building advanced security tools. When you see issues like this, it's common to see more problems, so this may just be the tip of the iceberg.

**Is it trustworthy?**

I would like to say that it's safe to use, and that it lives up to the promises made - but they haven't made enough information available for people to make an informed decision. If you add the lack of information with such basic mistakes as not making the download available over HTTPS, it doesn't instill much confidence. Companies focused on security should know better.

When you make decisions about what tools you use, you have to look at the full picture - and Ensafer is a great example of that. They've focused first on a pretty website, adding features - but not assuring trust. At this point, the only evidence of their security is the use of buzzwords. 
