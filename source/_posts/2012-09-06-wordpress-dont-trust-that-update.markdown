---
layout: post
title: "WordPress: Don't trust that update"
date: 2012-09-06 01:42
comments: true
categories: 
---

Want to know the easiest way to hack most of the WordPress installs on a host? It's as easy as attacking the host's internal DNS server, then just sitting back and waiting on users to install your backdoor. If you can manage to change the IP address that "api.wordpress.org" resolves to, you've won the battle.

I can't take credit for finding this, it was pointed out on Twitter:

{% tweet https://twitter.com/Katana__/status/241961133685219329 align='center' %}

So this is nothing new - though I don't think most users realize that this hole exists, or how hard it would be to find out that they've been attacked.

Internal networks rarely receive the same degree of scrutiny as public facing systems when it comes to updates and hardening, making an attack against an internal DNS server not just possible - but quite likely. Since HTTPS isn't used to protect against MITM attacks, and the packages aren't signed, so there's no verification that what you downloaded matches what was released. So going after the DNS server is just one attack option.

Here's a quick overview of just how it could happen:

* Hacker signs up for an account with a large host
* The attacker targets the internal DNS server and manages to redirect the API domain
* The API domain now points to an altered update check that serves an infected update package
* Users install updates with no idea that they aren't original

It would be trivial to modify the WordPress update package to add a backdoor and modify the update check (`wp-includes/update.php`) to point to the attacker's site - that way if the attack against the DNS server is fixed, compromised sites will remain compromised. This does assume that the host's internal DNS server has some vulnerability - but in my experience that wouldn't be surprising.

If the WordPress team started signing their updates, these issues would be gone; though it doesn't look like that will happen:

{% tweet https://twitter.com/Katana__/status/241997773984124928 align='center' %}

What makes this worse? Both the API and download domains already support HTTPS, but this doesn't do any good if the application is hardcoded to use HTTP.
