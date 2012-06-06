---
layout: post
title: "LinkedIn: A little common sense"
date: 2012-06-06 18:28
comments: true
categories: 
---

The fact that LinkedIn was breached has been well covered and [confirmed](http://blog.linkedin.com/2012/06/06/linkedin-member-passwords-compromised/), but in their confirmation they said something that I personally found insulting, more than anything else:

{% blockquote %}
It is worth noting that the affected members who update their passwords and members whose passwords have not been compromised benefit from the enhanced security we just recently put in place, which includes hashing and salting of our current password databases.
{% endblockquote %}

So, they just recently started salting their hashes? Seriously?

Storing passwords via unsalted SHA-1 is not only unsafe, it's reckless. When you store user credentials, you have a responsibility to your users to keep their data safe - in this case LinkedIn failed, epicly. Had they bothered to think about security, or hired people that understood even the most basic principles of secure application development - this wouldn't have happened.

When properly implemented, hashed data shouldn't be (practically) reversible to its original value - that is, after all, the purpose of hashing. Tweets like this though, make it painfully clear just how wrong LinkedIn got it:

{% tweet https://twitter.com/CrackMeIfYouCan/status/210474428407103490 align='center' %}

They violated the most basic security principles, but more importantly, they violated their users' trust.
