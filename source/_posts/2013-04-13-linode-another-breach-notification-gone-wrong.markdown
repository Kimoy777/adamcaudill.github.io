---
layout: post
title: "Linode: Another Breach Notification Gone Wrong"
date: 2013-04-13 10:04
comments: true
categories: 
---

Last night I received an email from Linode about a possible breach and mandatory password reset that reminded me of another recent email, in some disturbing ways.

{% blockquote %}
Dear Linode customer,

Linode administrators have discovered and blocked suspicious activity on the Linode network.
{% endblockquote %}

Not too long ago, I received a similar email from Evernote - not just in it's text, but in the errors made.

{% blockquote %}
Dear Evernote user, 

Evernote's Operations & Security team has discovered and blocked suspicious activity on the Evernote network that appears to have been a coordinated attempt to access secure areas of the Evernote Service.
{% endblockquote %}

When I received the email from Evernote, I quickly noticed that the links were to a different site - was it a thinly veiled phishing attempt? With all the links going to `links.evernote.mkt5371.com` it took a few minutes to work out that the email was actually legitimate. Instead of being able to quickly reset passwords, users were forced to try to figure out if the email was real or not.

When you are sending out a breach notification, it's *critical* that users are able to verify, as quickly as possible, that an email is legitimate, and the the call to action really is necessary. Linode, unfortunately, made a similar mistake.

{% img center /files/Screenshot_4_13_13_10_21_AM.png %}

The first thing that jumps out is that it's from `e2ma.net` - not Linode directly, next is that the first link in the email points to `e2.ma/message/...`. These are immediate red flags, the focus instantly switches from taking necessary action to secure a user's account to trying to figure out if they are being attacked. From comments on their [blog post](http://blog.linode.com/2013/04/12/security-notice-linode-manager-password-reset/), I'm not the only one that was disturbed by how the email was sent.

Thankfully, they didn't include a link to the password reset page, and they even told users not to click reset links in unsolicited emails - so it's not all bad. Users shouldn't be spending time trying to figure out if a notice is real instead of taking steps to secure their accounts. In situations where there may be a significant security issue, service providers should take every effort to minimize confusion - provide clear information, and make the source as clear as possible.
